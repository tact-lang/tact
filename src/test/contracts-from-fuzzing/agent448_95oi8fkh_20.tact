struct SliceTest {
    a: Slice;
    b: Slice?;
}

contract SliceTestContract {
    data: SliceTest;

    init() {
        self.data = SliceTest{
            a: emptyCell().asSlice(),
            b: null,
        };
    }

    receive() {}
}