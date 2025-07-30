struct SWithSlice {
    text: String;
    part: Slice;
    cl: Cell;
}

contract SliceTest {
    s: SWithSlice;

    init() {
        self.s = SWithSlice{
            text: "hello",
            part: emptyCell().asSlice(),
            cl: emptyCell()
        };
    }
}
