struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inn: Inner;
    val: String;
}

contract Test3 {
    state: Outer;

    init() {
        self.state = Outer{
            inn: Inner{
                a: 42,
                b: true
            },
            val: "deep"
        };
    }
}