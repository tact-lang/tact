struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Middle {
    inner: Inner?;
    flag: Bool;
}

struct Outer {
    middle: Middle?;
    name: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer {
            middle: null,
            name: "testing",
        };
    }
}