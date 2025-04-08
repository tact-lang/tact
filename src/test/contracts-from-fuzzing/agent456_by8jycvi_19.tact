struct ComplexNested {
    a: Int;
    b: Nested1;
}

struct Nested1 {
    c: Int;
    d: Nested2;
}

struct Nested2 {
    e: Bool;
    f: String;
}

contract ComplexNestedContract {
    data: ComplexNested;

    init() {
        self.data = ComplexNested {
            a:1,
            b: Nested1 {
                c:2,
                d: Nested2 {
                    e:true,
                    f:"xyz"
                }
            }
        };
    }
}