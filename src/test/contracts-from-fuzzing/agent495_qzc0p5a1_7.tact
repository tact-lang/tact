struct Inner1 {
    a: Int;
}
struct Inner2 {
    b: Bool;
}
struct Outer {
    i1: Inner1;
    i2: Inner2;
}

contract MultiNested {
    data: Outer;

    init() {
        self.data = Outer{
            i1: Inner1{ a: 42 },
            i2: Inner2{ b: false }
        };
    }
}