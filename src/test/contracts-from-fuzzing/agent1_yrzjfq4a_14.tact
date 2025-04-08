struct A { val: Int; }
struct B { val: Int; }
struct C {
    a: A;
    b: B;
    optInt: Int?;
}

contract CombinedStructs {
    data: C;

    init() {
        self.data = C{
            a: A{ val: 1 },
            b: B{ val: 2 },
            optInt: null
        };
    }
}