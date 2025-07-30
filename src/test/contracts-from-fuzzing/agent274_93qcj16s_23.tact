struct SliceInt {
    data: Slice;
    num: Int;
}

contract SliceAndIntTest {
    f: SliceInt;

    init() {
        self.f = SliceInt{
            data: emptyCell().asSlice(),
            num: 12345,
        };
    }
}