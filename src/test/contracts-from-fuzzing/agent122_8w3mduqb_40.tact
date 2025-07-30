contract Overflows {
    small: Int as uint4;
    signed: Int as int8;

    init() {
        self.small = 0;     // ok
        self.small = 50;    // overflow, but deferred
        self.small = -1;    // underflow, but deferred
        self.small = 3;     // final legal assignment

        self.signed = -128;   // min ok
        self.signed = 200;    // overflow deferred
        self.signed = -200;   // underflow deferred
        self.signed = 127;    // max ok
    }
}
