struct OuterWithSlice {
    num: Int;
    bytes: Slice;
}

contract Test {
    stuff: OuterWithSlice;

    init() {
        self.stuff = OuterWithSlice{
            num: 42,
            bytes: "hello".asComment().asSlice()
        };
    }
}
