struct Inner {
    a: Int = 5;
    b: Bool = false;
    c: String = "init";
}

struct Outer {
    inr: Inner = Inner{};
    note: String = "default";
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inr: Inner{
                a: 42,
                b: true,
                c: "override"
            },
            note: "hi"
        };
    }
}