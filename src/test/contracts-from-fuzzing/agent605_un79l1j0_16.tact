struct RestTest {
    a: Int;
    b: Slice as remaining;
}

contract RestHolder {
    val: RestTest;

    init() {
        self.val = RestTest{
            a: 123,
            b: emptyCell().asSlice()
        };
    }
}