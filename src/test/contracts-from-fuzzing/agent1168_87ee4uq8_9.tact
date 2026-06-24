struct BigNested {
    a: Int;
    inner1: Inner1;
    b: String;
    inner2: Inner2;
    c: Bool;
}

struct Inner1 {
    x: Int;
    y: String;
    z: Bool;
}

struct Inner2 {
    f: Int;
    g: Bool;
    h: String;
}

contract MixedNested {
    storage: BigNested;

    init() {
      self.storage = BigNested{
            a: 1,
            inner1: Inner1{ x: 2, y: "2", z: true },
            b: "str",
            inner2: Inner2{ f: 3, g: false, h: "h" },
            c: false
        };
    }
}