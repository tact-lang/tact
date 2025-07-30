struct A {
    one: Int;
    two: Bool;
    three: String;
}

struct B {
    aa: A;
    bb: A;
}

struct C {
    bfield: B;
    optA: A?;
}

struct D {
    cfield: C;
    s: String;
}

contract LayerCake {
    state: D;

    init() {
        self.state = D{
            cfield: C{
                bfield: B{
                    aa: A{one:1,two:true,three:"X"},
                    bb: A{one:2,two:false,three:"Y"}
                },
                optA: null
            },
            s: "done"
        };
    }
}