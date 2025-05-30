struct Atom {
    n: Int;
    b: Bool;
    s: String;
}

struct Composite {
    a1: Atom;
    a2: Atom;
    a3: Atom;
}

contract NestedStructs {
    store: Composite;

    init() {
        self.store = Composite{
            a1: Atom{ n:1,b:true,s:"one" },
            a2: Atom{ n:2,b:false,s:"two" },
            a3: Atom{ n:3,b:true,s:"three" }
        };
    }
}
