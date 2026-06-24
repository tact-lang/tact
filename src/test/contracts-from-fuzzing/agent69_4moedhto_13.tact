struct NestedComplex {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    a: Int;
    b: Address;
}

struct Inner2 {
    s: Slice;
    c: Inner3;
}

struct Inner3 {
    f: Bool;
    t: Int?;
}

contract NestedComplexTest {
    nested: NestedComplex;

    init() {
        self.nested = NestedComplex{
            inner1: Inner1{ a: 1, b: myAddress() },
            inner2: Inner2{
                s: emptyCell().asSlice(),
                c: Inner3{ f: true, t: null }
            }
        };
    }
}