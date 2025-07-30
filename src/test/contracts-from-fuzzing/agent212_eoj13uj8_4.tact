struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle {
    i: Inner;
    s: String;
    f: Bool? = null;
}

struct Container1 { m: Middle; }
struct Container2 { m: Middle; }
struct Container3 { m: Middle; }

contract TestContract {
    x: Container1 = Container1{ m: Middle{ i: Inner{ a: 1, b: true }, s: "a", f: true } };
    y: Container2 = Container2{ m: Middle{ i: Inner{ a: 2, b: null }, s: "b", f: false } };
    z: Container3 = Container3{ m: Middle{ i: Inner{ a: 3, b: true }, s: "c", f: null } };
    init() {}
}