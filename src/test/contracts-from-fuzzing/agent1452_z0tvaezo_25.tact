struct TinyInt {
    t: Int as uint4;
}

contract SmallUint {
    val: TinyInt;

    init() {
        self.val = TinyInt{t: 15};
    }
}