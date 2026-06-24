struct A {
    i: Int;
    optB: B?;
}

struct B {
    j: Int;
    optC: C?;
}

struct C {
    k: Int;
    flag: Bool?;
}

contract OptionalDeepNestedStruct {
    data: A;

    init() {
        self.data = A{
            i: 10,
            optB: B{
                j: 20,
                optC: C{
                    k: 30,
                    flag: null
                }
            }
        };
    }
}