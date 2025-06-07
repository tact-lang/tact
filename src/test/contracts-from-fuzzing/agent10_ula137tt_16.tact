contract Test {
    // Test compile-time 'cell' with a base64 string missing required padding characters
    // The valid example in the docs contains a trailing '=', so here we remove it to test if the compiler rejects it
    stored: Cell = cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA");

    receive () {}
}
