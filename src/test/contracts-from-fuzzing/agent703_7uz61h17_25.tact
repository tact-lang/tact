struct A { foo: Int }
struct B { bar: Int }

struct AB {
    a: A;
    b: B;
}

contract StructTupleSimulation {
    ab: AB;

    init() {
        self.ab = AB{
            a: A{ foo:5 },
            b: B{ bar:10 }
        };
    }
}