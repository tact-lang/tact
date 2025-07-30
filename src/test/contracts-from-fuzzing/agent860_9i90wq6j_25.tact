struct TailRem {
    x: Int;
    rem: Slice as remaining;
}

contract RemainderTest {
    t: TailRem;

    init() {
        self.t = TailRem{x: 42, rem: "".asComment().asSlice()};
    }
}