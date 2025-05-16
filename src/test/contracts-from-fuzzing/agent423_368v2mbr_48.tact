struct Atom {
    a: Int;
    b: Bool;
}

struct Container {
    one: Atom;
    two: Atom;
}

contract DoubleNestedStruct {
    field: Container = Container{
        one: Atom{ a:1, b:true },
        two: Atom{ a:2, b:false }
    };
}