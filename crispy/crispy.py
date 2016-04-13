#!/usr/bin/env python
# coding: utf-8


def main():
    import os
    import sys

    from PyQt5.QtGui import QIcon
    from PyQt5.QtCore import Qt, QSize
    from PyQt5.QtWidgets import QApplication

    from crispy.gui import canvas

    app = QApplication(sys.argv)

    window = canvas.MainWindow()
    window.show()

    sys.exit(app.exec_())


if __name__ == '__main__':
    main()