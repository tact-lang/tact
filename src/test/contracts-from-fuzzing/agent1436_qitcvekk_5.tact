struct Inner {
    a: Int;
    b: String;
}

struct Wrapper {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
    nested4: Inner;
    nested5: Inner;
}

contract TestContract {
    multiNested: Wrapper;

    init() {
        self.multiNested = Wrapper{
            nested1: Inner{ a: 1, b: "one" },
            nested2: Inner{ a: 2, b: "two" },
            nested3: Inner{ a: 3, b: "three" },
            nested4: Inner{ a: 4, b: "four" },
            nested5: Inner{ a: 5, b: "five" }
        };
    }
}