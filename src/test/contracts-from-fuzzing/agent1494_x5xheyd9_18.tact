struct HasSlice {
    s: Slice;
}

struct HasInt {
    i: Int;
}

contract MultipleStructFieldsTest {
    f1: HasSlice;
    f2: HasInt;

    init() {
        self.f1 = HasSlice{ s: emptyCell().asSlice() };
        self.f2 = HasInt{ i: 42 };
    }
}
