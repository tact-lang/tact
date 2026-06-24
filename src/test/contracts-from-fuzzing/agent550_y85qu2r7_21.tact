struct TailRem {
    val: Int;
    tail: Slice as remaining;
}

contract RemTest {
    data: TailRem;

    init() {
        self.data = TailRem{
            val:1,
            tail:emptyCell().asSlice()
        };
    }
}