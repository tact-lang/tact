struct OptSlice {
    s: Slice?;
}

contract OptSliceTest {
    data: OptSlice;

    init() {
        self.data = OptSlice{
            s: emptyCell().asSlice()
        };
    }
}