struct WrapSlice {
    s: Slice;
}

struct OuterStruct {
    foo: WrapSlice;
    bar: Int;
    baz: Bool;
}

contract WrapTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            foo: WrapSlice{ s: emptyCell().asSlice() },
            bar: 5,
            baz: true
        };
    }
}