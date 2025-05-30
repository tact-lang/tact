struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: String?;
}

struct Outer {
    x: Int;
    y: Bool;
    z: String;
    inner: Inner;
}

contract ManyNestedFields {
    payload: Outer;

    init() {
        self.payload = Outer{
            x: 12,
            y: false,
            z: "data",
            inner: Inner{a: 5, b: true, c: "aaa", d: null, e: "ok"}
        };
    }
}