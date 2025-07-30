struct InnerMost { val: Int }
struct Middle { inner: InnerMost }
struct Outer {
    middle: Middle;
    other: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{ inner: InnerMost{ val: 42 } },
            other: 7
        };
    }
}