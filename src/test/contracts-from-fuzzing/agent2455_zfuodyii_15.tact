struct Inner {
    a: Int?;
    b: Bool;
}

struct Outer {
    i: Inner?;
    s: String;
}

contract EdgeOpt {
    val: Outer;

    init() {
        self.val = Outer{
            i: null,
            s: "test"
        };
    }
}