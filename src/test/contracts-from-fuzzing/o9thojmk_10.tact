// Combined snippet to test earliest documentation examples for compile-time functions

// 1. Test address embedding
contract ExampleAddress {
    addr: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
}

// 2. Test cell embedding
contract ExampleCell {
    stored: Cell = cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA=");
}

// 3. Test slice embedding
contract ExampleSlice {
    stored: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="); // expected to be "Hello world!"
}
