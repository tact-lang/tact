struct Inner {
    x: Int;
}

struct Outer {
    y: Int;
    inn: Inner;
}

contract TestDeepStruct {
    store: Outer;

    init() {
        self.store = Outer{
            y: 1,
            inn: Inner{ x: 2 }
        };
    }
}
