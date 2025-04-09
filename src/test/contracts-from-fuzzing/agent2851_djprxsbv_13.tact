struct A { s: String }
struct B { t: String }
struct C { a: A; b: B }

contract NestedStringStructs {
    inner: C;

    init() {
        self.inner = C{
            a: A{s: "one"},
            b: B{t: "two"},
        };
    }
}
