struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle {
    m: Inner;
    x: Int?;
}

struct Outer {
    o: Middle?;
    note: String;
}

contract TestContract {
    val: Outer = Outer{
        o: null,
        note: "sample",
    };
}