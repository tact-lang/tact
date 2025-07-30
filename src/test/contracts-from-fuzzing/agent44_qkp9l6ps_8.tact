struct DeepNested {
    a: A;
}

struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: E;
}

struct E {
    value: Int;
}

contract DeepNestedStruct {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            a: A{
                b: B{
                    c: C{
                        d: D{
                            e: E{
                                value: 123
                            }
                        }
                    }
                }
            }
        };
    }
}