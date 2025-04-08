contract UIntOverflow {
    x: Int as uint8;

    init() {
        self.x = 260;  // over 255, so should cause exit code 5 at runtime, but compile fine
    }
}
