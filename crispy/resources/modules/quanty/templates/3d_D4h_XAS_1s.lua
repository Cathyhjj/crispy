--------------------------------------------------------------------------------
-- Quanty input file generated using Crispy.
--
-- elements: 3d transition metals
-- symmetry: D4h
-- experiment: XAS
-- edge: K (1s)
--------------------------------------------------------------------------------
Verbosity(0x00FF)

--------------------------------------------------------------------------------
-- Initialize the Hamiltonians.
--------------------------------------------------------------------------------
H_i = 0
H_f = 0

--------------------------------------------------------------------------------
-- Toggle the Hamiltonian terms.
--------------------------------------------------------------------------------
H_coulomb             = $H_coulomb
H_soc                 = $H_soc
H_cf                  = $H_cf

--------------------------------------------------------------------------------
-- Define the number of electrons, shells, etc.
--------------------------------------------------------------------------------
NBosons = 0
NFermions = 12

NElectrons_1s = 2
NElectrons_3d = $NElectrons_3d

IndexDn_1s = {0}
IndexUp_1s = {1}
IndexDn_3d = {2, 4, 6, 8, 10}
IndexUp_3d = {3, 5, 7, 9, 11}

--------------------------------------------------------------------------------
-- Define the Coulomb term.
--------------------------------------------------------------------------------
F0_3d_3d = NewOperator('U', NFermions, IndexUp_3d, IndexDn_3d, {1, 0, 0})
F2_3d_3d = NewOperator('U', NFermions, IndexUp_3d, IndexDn_3d, {0, 1, 0})
F4_3d_3d = NewOperator('U', NFermions, IndexUp_3d, IndexDn_3d, {0, 0, 1})

F0_1s_3d = NewOperator('U', NFermions, IndexUp_1s, IndexDn_1s, IndexUp_3d, IndexDn_3d, {1}, {0})
G2_1s_3d = NewOperator('U', NFermions, IndexUp_1s, IndexDn_1s, IndexUp_3d, IndexDn_3d, {0}, {1})

N_1s = NewOperator('Number', NFermions, IndexUp_1s, IndexUp_1s, {1})
     + NewOperator('Number', NFermions, IndexDn_1s, IndexDn_1s, {1})

N_3d = NewOperator('Number', NFermions, IndexUp_3d, IndexUp_3d, {1, 1, 1, 1, 1})
     + NewOperator('Number', NFermions, IndexDn_3d, IndexDn_3d, {1, 1, 1, 1, 1})

if H_coulomb == 1 then
    U_3d_3d_i  = $U(3d,3d)_i_value * $U(3d,3d)_i_scaling
    F2_3d_3d_i = $F2(3d,3d)_i_value * $F2(3d,3d)_i_scaling
    F4_3d_3d_i = $F4(3d,3d)_i_value * $F4(3d,3d)_i_scaling
    F0_3d_3d_i = U_3d_3d_i + 2 / 63 * F2_3d_3d_i + 2 / 63 * F4_3d_3d_i

    U_3d_3d_f  = $U(3d,3d)_f_value * $U(3d,3d)_f_scaling
    F2_3d_3d_f = $F2(3d,3d)_f_value * $F2(3d,3d)_f_scaling
    F4_3d_3d_f = $F4(3d,3d)_f_value * $F4(3d,3d)_f_scaling
    F0_3d_3d_f = U_3d_3d_f + 2 / 63 * F2_3d_3d_f + 2 / 63 * F4_3d_3d_f
    U_1s_3d_f  = $U(1s,3d)_f_value * $U(1s,3d)_f_scaling
    G2_1s_3d_f = $G2(1s,3d)_f_value * $G2(1s,3d)_f_scaling
    F0_1s_3d_f = U_1s_3d_f + 1 / 10 * G2_1s_3d_f

    H_i = H_i
        + F0_3d_3d_i * F0_3d_3d
        + F2_3d_3d_i * F2_3d_3d
        + F4_3d_3d_i * F4_3d_3d

    H_f = H_f
        + F0_3d_3d_f * F0_3d_3d
        + F2_3d_3d_f * F2_3d_3d
        + F4_3d_3d_f * F4_3d_3d
        + F0_1s_3d_f * F0_1s_3d
        + G2_1s_3d_f * G2_1s_3d
end

--------------------------------------------------------------------------------
-- Define the spin-orbit coupling term.
--------------------------------------------------------------------------------
ldots_3d = NewOperator('ldots', NFermions, IndexUp_3d, IndexDn_3d)

if H_soc == 1 then
    zeta_3d_i = $zeta(3d)_i_value * $zeta(3d)_i_scaling

    zeta_3d_f = $zeta(3d)_f_value * $zeta(3d)_f_scaling

    H_i = H_i
        + zeta_3d_i * ldots_3d

    H_f = H_f
        + zeta_3d_f * ldots_3d
end

--------------------------------------------------------------------------------
-- Define the crystal field term.
--------------------------------------------------------------------------------
Dq_3d = NewOperator('CF', NFermions, IndexUp_3d, IndexDn_3d, PotentialExpandedOnClm('D4h', 2, { 6,  6, -4, -4}))
Ds_3d = NewOperator('CF', NFermions, IndexUp_3d, IndexDn_3d, PotentialExpandedOnClm('D4h', 2, {-2,  2,  2, -1}))
Dt_3d = NewOperator('CF', NFermions, IndexUp_3d, IndexDn_3d, PotentialExpandedOnClm('D4h', 2, {-6, -1, -1,  4}))

if H_cf == 1 then
    Dq_3d_i = $Dq(3d)_i_value * $Dq(3d)_i_scaling
    Ds_3d_i = $Ds(3d)_i_value * $Ds(3d)_i_scaling
    Dt_3d_i = $Dt(3d)_i_value * $Dt(3d)_i_scaling

    Dq_3d_f = $Dq(3d)_f_value * $Dq(3d)_f_scaling
    Ds_3d_f = $Ds(3d)_f_value * $Ds(3d)_f_scaling
    Dt_3d_f = $Dt(3d)_f_value * $Dt(3d)_f_scaling

    H_i = H_i
        + Dq_3d_i * Dq_3d
        + Ds_3d_i * Ds_3d
        + Dt_3d_i * Dt_3d

    H_f = H_f
        + Dq_3d_f * Dq_3d
        + Ds_3d_f * Ds_3d
        + Dt_3d_f * Dt_3d
end

--------------------------------------------------------------------------------
-- Define the magnetic field term.
--------------------------------------------------------------------------------
Sx_3d    = NewOperator('Sx'   , NFermions, IndexUp_3d, IndexDn_3d)
Sy_3d    = NewOperator('Sy'   , NFermions, IndexUp_3d, IndexDn_3d)
Sz_3d    = NewOperator('Sz'   , NFermions, IndexUp_3d, IndexDn_3d)
Ssqr_3d  = NewOperator('Ssqr' , NFermions, IndexUp_3d, IndexDn_3d)
Splus_3d = NewOperator('Splus', NFermions, IndexUp_3d, IndexDn_3d)
Smin_3d  = NewOperator('Smin' , NFermions, IndexUp_3d, IndexDn_3d)

Lx_3d    = NewOperator('Lx'   , NFermions, IndexUp_3d, IndexDn_3d)
Ly_3d    = NewOperator('Ly'   , NFermions, IndexUp_3d, IndexDn_3d)
Lz_3d    = NewOperator('Lz'   , NFermions, IndexUp_3d, IndexDn_3d)
Lsqr_3d  = NewOperator('Lsqr' , NFermions, IndexUp_3d, IndexDn_3d)
Lplus_3d = NewOperator('Lplus', NFermions, IndexUp_3d, IndexDn_3d)
Lmin_3d  = NewOperator('Lmin' , NFermions, IndexUp_3d, IndexDn_3d)

Jx_3d    = NewOperator('Jx'   , NFermions, IndexUp_3d, IndexDn_3d)
Jy_3d    = NewOperator('Jy'   , NFermions, IndexUp_3d, IndexDn_3d)
Jz_3d    = NewOperator('Jz'   , NFermions, IndexUp_3d, IndexDn_3d)
Jsqr_3d  = NewOperator('Jsqr' , NFermions, IndexUp_3d, IndexDn_3d)
Jplus_3d = NewOperator('Jplus', NFermions, IndexUp_3d, IndexDn_3d)
Jmin_3d  = NewOperator('Jmin' , NFermions, IndexUp_3d, IndexDn_3d)

Sx = Sx_3d
Sy = Sy_3d
Sz = Sz_3d

Lx = Lx_3d
Ly = Ly_3d
Lz = Lz_3d

Jx = Jx_3d
Jy = Jy_3d
Jz = Jz_3d

Ssqr = Sx * Sx + Sy * Sy + Sz * Sz
Lsqr = Lx * Lx + Ly * Ly + Lz * Lz
Jsqr = Jx * Jx + Jy * Jy + Jz * Jz

Bx = $Bx * EnergyUnits.Tesla.value
By = $By * EnergyUnits.Tesla.value
Bz = $Bz * EnergyUnits.Tesla.value

B = Bx * (2 * Sx + Lx)
  + By * (2 * Sy + Ly)
  + Bz * (2 * Sz + Lz)

H_i = H_i
    + B

H_f = H_f
    + B

--------------------------------------------------------------------------------
-- Define the restrictions and set the number of initial states.
--------------------------------------------------------------------------------
InitialRestrictions = {NFermions, NBosons, {'11 0000000000', NElectrons_1s, NElectrons_1s},
                                           {'00 1111111111', NElectrons_3d, NElectrons_3d}}

NPsis = $NPsis
Psis = Eigensystem(H_i, InitialRestrictions, NPsis)

if not (type(Psis) == 'table') then
    Psis = {Psis}
end

Operators = {H_i, Ssqr, Lsqr, Jsqr, Sz, Lz, Jz, N_1s, N_3d}
header = '\nAnalysis of the initial Hamiltonian:\n'
header = header .. '==============================================================================================\n'
header = header .. '   i       <E>     <S^2>     <L^2>     <J^2>      <Sz>      <Lz>      <Jz>    <N_1s>    <N_3d>\n'
header = header .. '==============================================================================================\n'
footer = '==============================================================================================\n'

io.write(header)
for i, Psi in ipairs(Psis) do
    io.write(string.format('%4d', i))
    for j, Operator in ipairs(Operators) do
        io.write(string.format('%10.4f', Complex.Re(Psi * Operator * Psi)))
    end
    io.write('\n')
end
io.write(footer)

--------------------------------------------------------------------------------
-- Define the transition operators.
--------------------------------------------------------------------------------
t = math.sqrt(1/2);

Txy_1s_3d   = NewOperator('CF', NFermions, IndexUp_3d, IndexDn_3d, IndexUp_1s, IndexDn_1s, {{2, -2, t * I}, {2, 2, -t * I}})
Txz_1s_3d   = NewOperator('CF', NFermions, IndexUp_3d, IndexDn_3d, IndexUp_1s, IndexDn_1s, {{2, -1, t    }, {2, 1, -t    }})
Tyz_1s_3d   = NewOperator('CF', NFermions, IndexUp_3d, IndexDn_3d, IndexUp_1s, IndexDn_1s, {{2, -1, t * I}, {2, 1,  t * I}})
Tx2y2_1s_3d = NewOperator('CF', NFermions, IndexUp_3d, IndexDn_3d, IndexUp_1s, IndexDn_1s, {{2, -2, t    }, {2, 2,  t    }})
Tz2_1s_3d   = NewOperator('CF', NFermions, IndexUp_3d, IndexDn_3d, IndexUp_1s, IndexDn_1s, {{2,  0, 1    }                })

--------------------------------------------------------------------------------
-- Calculate and save the spectra.
--------------------------------------------------------------------------------
-- Define the temperature.
T = $T * EnergyUnits.Kelvin.value

-- Initialize the partition function and the spectra.
Z = 0
G = 0

Emin = $Emin1
Emax = $Emax1
Gamma = $Gamma1
NE = $NE1

-- Calculate the ground state energy.
E_gs = Psis[1] * H_i * Psis[1]

for i, Psi in ipairs(Psis) do
    E = Psi * H_i * Psi

    if math.abs(E - E_gs) < 1e-12 then
        dZ = 1
    else
        dZ = math.exp(-(E - E_gs) / T)
    end

    if (dZ < 1e-8) then
        break
    end

    Z = Z + dZ

    for j, Operator in ipairs({Txy_1s_3d, Txz_1s_3d, Tyz_1s_3d, Tx2y2_1s_3d, Tz2_1s_3d}) do
        G = G + CreateSpectra(H_f, Operator, Psi, {{'Emin', Emin}, {'Emax', Emax}, {'NE', NE}, {'Gamma', Gamma}}) * dZ
    end
end

G = G / 5 / Z
G.Print({{'file', '$baseName' .. '_iso.spec'}})
