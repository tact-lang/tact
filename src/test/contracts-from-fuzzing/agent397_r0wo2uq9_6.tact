struct Inner1 { a: Int }
struct Inner2 { b: String }
struct Inner3 { c: Bool }

struct Outer {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract NestedMix {
    data: Outer;

    init() {
        self.data = Outer{
            i1: Inner1{ a: 10 },
            i2: Inner2{ b: "test" },
            i3: Inner3{ c: true }
        };
    }
}