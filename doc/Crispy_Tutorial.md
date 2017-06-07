
# Running your first simulation.

### 1. generate XANES spectras
***

An example of Mn(II) metal K pre-edge simulation is shown in the first tutorial.
In this tutorial, it includes:

* **Parameters set-up**

* **Running simulations and reading Quanty output files**

* **Save the spectra data and graph**

* **Run multi-calculations and merge data**

* **Save calculation and Quanty input files**

#### | 1.1 Parameters set-up |


<ol start="1">
<li> Run Crispy software and you can see the interface as follows. On the right panel, there are four folded panels. In **'General Setup'**, you can choose the metal element that you want to calculate. In our first tutorial, we are going to calculate K pre-edge XANES for Mn(II) compound. So in **'Elment and Symmetry'** we click on **'Mn'**.</li>

<img src="crop_2.png" alt="Drawing" style="width: 666px;"/>
    
    
<li> Then we can choose the oxidation state and symmetry. So far only octahedral (**Oh**) and elongated octahedral (**D4h**) are available. In the future work, we are going to implement more symmetry choices. In the **'Experiment and Edge'** set-up, we keep XAS and K-edge choice. </li>

<img src="crop_3.png" alt="Drawing" style="width: 666px;"/>


<li> Above are the basic parameters. Now we switch to the second parameter panel **'States and Spectrum Parameters'**, we keep the default values. It's worth noting that Quanty doesn't give correct absolute **absorption energy**. What we are interested are the spectral features and the relative absorption energies, so that one should calibrate/shift the absorption energy in respect to experiment measurements. If more fined spectra data is needed, increase the **Number of Points**. The **Gamma FWHM** is the life-time broadening.

<img src="crop_5.png" alt="Drawing" style="width: 666px;"/>


<li> The **Hamiltonian Setup** is the soul of the simulation. So far, four Halmitonians set-ups are available in Crispy:
   - **Coulomb term: ** described by Slater-Condon Parameters, more detailed description → *[Click Here](http://www.quanty.org/documentation/standard_operators/coulomb_repulsion)*
   - **Spin-Orbit Coupling: ** more detailed description → *[Click Here](http://www.quanty.org/documentation/standard_operators/spin_orbit_coupling)*
   - **Crystal Field: ** more detailed description → *[Click Here](http://www.quanty.org/documentation/standard_operators/crystal_field)*
   - **3d-Ligands Hybridization** more detailed description → *[Click Here](http://www.quanty.org/documentation/standard_operators/ligand_field)*
</ol>
By double click the Parameter Value, one can change the parameters into the values of interest. In our first tutorial, we keep the default values.

<img src="crop_6.png" alt="Drawing" style="width: 666px;"/>

Crystal field default value is 1.0 now.   

<img src="crop_7.png" alt="Drawing" style="width: 666px;"/>


#### | 1.2 Running simulations and reading Quanty output files |

<ol start="1">
<li> After setting all the parameters, we can simply click the **Run** button to carry out the calculation. When the calculation is done, the generated spectrum is automatically plotted in the left panel. By clicking the buttons on the plotting panel, one can change the plotting style/scale/colors.

<img src="crop_8.png" alt="Drawing" style="width: 666px;"/>
<img src="crop_9.png" alt="Drawing" style="width: 666px;"/>
   
   
<li> Drag up the bottom of the plotting, and the output file is printed for Quanty. By looking at the output file, one can find the initial state Halmitonian and final state Halmitonian information.
</ol>
<img src="crop_10.png" alt="Drawing" style="width: 666px;"/>
   
   

#### | 1.3 Save the spectra data and graph |

<ol start="1">
<li> By clicking the **'Save'** button, the generated spectra can be saved into images or .txt files so that the data can be further plotted by other softwares.
</ol>
<img src="crop_12.png" alt="Drawing" style="width: 666px;"/>

#### | 1.4 Run multi-calculations and merge data |

<ol start="1">
<li> One of the greatest advantage of Crispy is the ability of running multiple calculations. And this greatly facilitate playing around with different parameters. When we want to run another calculation, we can simply go back to parameter panels. For example, I selected another metal Ni(III).

<img src="crop_13.png" alt="Drawing" style="width: 666px;"/>
   
   
<li> One of the greatest advantage of Crispy is the ability of running multiple calculations. And this greatly facilitate playing around with different parameters. When we want to run another calculation, we can simply go back to parameter panels. For example, I selected another metal Mg(III). After changing the parameters, we find one more Calculation **Mg | 3+ | Oh | XAS | K(1s)** in the results panel. If we want to check the detailed values for one specific calculation, we can click on it and the values in corresponding parameter panels will automatically changed to the values we set for that specific calculation.

<img src="crop_14.png" alt="Drawing" style="width: 666px;"/>
   
   
<li> By selecting both results, we can merge different spectra.
</ol>
<img src="crop_15.png" alt="Drawing" style="width: 666px;"/>
   

#### | 1.5 Save calculation and Quanty input files |

<ol start="1">
<li> In **Part 1.4**, we already showed how to run multiple calculations. Assumed that we have ran a lot of calculations, we want to save a series of calculations with their corresponding parameters. And this can be done by right clicking **Save Selected Calculations As** a .pkl file. Therefore, when restarting the program, we can choose **Load Calculations** to load the .pkl file to recover the status before.

<img src="crop_16.png" alt="Drawing" style="width: 666px;"/>
<img src="crop_17.png" alt="Drawing" style="width: 666px;"/>
   
   
<li> Quanty is written in LUA language. And Crispy is able to generate Quanty input file. This is useful to modify some scripts for more specific calculations including the terms which aren't included in the interface.
</ol>
<img src="crop_11.png" alt="Drawing" style="width: 666px;"/>
