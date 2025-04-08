struct A {
    x: Int?;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

contract NestedNulls {
    nested: C = C{b: null};

    receive() {
        if (self.nested.b != null) {
            let b = self.nested.b!!;
            if (b.a != null) {
                let a = b.a!!;
                if (a.x != null) {
                    let _ = a.x!!;
                }
            }
        }
    }
}