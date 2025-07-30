struct A { val: Int }
struct B { val: Int }
struct C { val: Int }

struct Complex {
    a: A;
    b: B;
    c: C;
    optStruct: B?;
}

contract MultiStructFields {
    data: Complex;

    init() {
        self.data = Complex{
            a: A{ val:1 },
            b: B{ val:2 },
            c: C{ val:3 },
            optStruct: null
        };
    }
}
