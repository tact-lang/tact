struct BaseA {
    one: Int;
    two: String;
    three: Bool;
}

struct BaseB {
    x: Int;
    y: String;
}

struct Composite {
    a: BaseA;
    b: BaseB;
    label: String;
}

contract StructComposition {
    c: Composite;
    init() {
        self.c = Composite{
            a: BaseA{one:1, two:"two", three:false},
            b: BaseB{x:11, y:"yy"},
            label: "done"
        };
    }
}