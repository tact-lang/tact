contract LargestSupportedIntWidths {
    a: Int as uint256;
    b: Int as int256;
    c: Int as uint1;
    d: Int as int1;

    init() {
        self.a=1;
        self.b=-1;
        self.c=1;
        self.d=0;
    }
}