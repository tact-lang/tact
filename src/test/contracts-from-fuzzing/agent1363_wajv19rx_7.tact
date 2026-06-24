struct Inner {
    val1: Int?;
    val2: String?;
}

struct Mid {
    i: Int;
    inner: Inner?;
    flag: Bool;
}

struct Outer {
    x: Mid?;
    y: String;
}

contract OptionalNest {
    data: Outer;

    init() {
        self.data = Outer{
            x: Mid{
                i: 5,
                inner: null,
                flag: true,
            },
            y: "abc",
        };
    }
}