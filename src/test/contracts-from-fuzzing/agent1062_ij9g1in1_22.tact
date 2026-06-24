struct A {
    a:Int?;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

contract ContractABC {
    data: C;

    init() {
        self.data = C{
            c: B{
                b: A{
                    a: null
                }
            }
        };
    }
}