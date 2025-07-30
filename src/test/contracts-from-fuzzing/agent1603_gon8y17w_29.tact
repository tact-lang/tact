struct Base {
    val1: Int;
    val2: Int;
}

struct Wrapper {
    inner: Base;
    note: String;
}

contract StructWrapTest {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: Base{val1:5, val2:10},
            note: "wrapped"
        };
    }
}