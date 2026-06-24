struct A {
    flag: Bool;
}

struct B {
    nested: A?;
}

struct C {
    inside: B?;
}

contract DeepOptional {
    data: C;

    init() {
        self.data = C {
            inside: B {
                nested: A {
                    flag: true
                }
            }
        };
    }
}