struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Int; }
struct Inner4 { d: Int; }
struct Inner5 { e: Int; }

struct BigNested {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
    i4: Inner4;
    i5: Inner5;
    extra: Int;
}

contract TestContract {
    data: BigNested;
    init() {
        self.data = BigNested{
            i1: Inner1{ a: 1 },
            i2: Inner2{ b: 2 },
            i3: Inner3{ c: 3 },
            i4: Inner4{ d: 4 },
            i5: Inner5{ e: 5 },
            extra: 999
        };
    }
}