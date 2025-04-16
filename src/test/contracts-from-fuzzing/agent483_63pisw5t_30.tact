struct InnerRemainder {
    prefix: Int;
    rest: Slice as remaining;
}

contract RemainStruct {
    val: InnerRemainder;

    init() {
        self.val = InnerRemainder{
            prefix: 77,
            rest: "hello".asComment().asSlice()
        };
    }
}
