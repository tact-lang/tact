struct Inner1 { x: Int; }
struct Inner2 { x: Int; }
struct Outer {
    a: Inner1;
    b: Int;
    c: Inner2;
    d: Bool;
}

contract InterleavedTypes {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner1{ x:1 },
            b:2,
            c: Inner2{ x:3 },
            d: true
        };
    }
}