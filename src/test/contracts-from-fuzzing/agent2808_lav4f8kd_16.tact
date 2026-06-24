contract Test {
    bigInt: Int = 1234567890123456789012345678901234567890;
    smallInt: Int as uint8 = 255;
    optBool: Bool? = null;
    str: String = "test string";
    optStr: String? = null;
    sliceField: Slice;
    
    init() {
        self.sliceField = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    }
}