contract TestBitShift {
    receive() {
         let a: Int = 8 << 2;  // expected 32
         let b: Int = 32 >> 3; // expected 4
         dump(a);
         dump(b);
    }
}
