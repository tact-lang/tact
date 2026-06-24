/// Test case: Valid usage of compile-time function cell()
contract TestCellValid {
    // Embedding a valid base64-encoded BoC into a Cell
    c: Cell = cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA=");

    receive () {}
}
