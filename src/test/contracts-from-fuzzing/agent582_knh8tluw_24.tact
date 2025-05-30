struct RemnantDemo {
    prefix: Int;
    data: Slice as remaining;
}

contract RemainingSliceTest {
    val: RemnantDemo;

    init() {
        self.val = RemnantDemo{
            prefix: 1,
            data: emptyCell().asSlice()
        };
    }
}
