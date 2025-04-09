struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Bool;
}
struct Outer {
    a: Inner1;
    b: Inner2;
}

contract MultiNested {
    data: Outer;
    init() {
        self.data = Outer{
            a: Inner1{ x: 99 },
            b: Inner2{ y: false }
        };
    }
}
