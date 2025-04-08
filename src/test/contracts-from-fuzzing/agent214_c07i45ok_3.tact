struct Inner {
    x: Int;
    y: Bool?;
    s: String;
}

struct Outer {
    inside: Inner;
    flag: Bool;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inside: Inner{
                x: 5,
                y: null,
                s: "deep",
            },
            flag: true,
        };
    }
}