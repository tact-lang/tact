struct A { val1: Int; opt1: Bool?; }
struct B { val2: Int; opt2: String?; }
struct C { val3: Int; opt3: Int?; }

struct Composite {
    a: A;
    b: B;
    c: C;
    optFinal: Bool?;
}

contract CompositeNestedFields {
    payload: Composite;
    init() {
        self.payload = Composite{
            a: A{ val1:1, opt1:null },
            b: B{ val2:2, opt2:null },
            c: C{ val3:3, opt3:null },
            optFinal: null
        };
    }
}
