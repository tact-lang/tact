contract TestTonValid {
    // Valid usage of ton() with a proper human-readable Toncoin value
    t: Int = ton("1.0");

    receive () {}
}
