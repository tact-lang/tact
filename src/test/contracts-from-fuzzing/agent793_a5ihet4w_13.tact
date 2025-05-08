struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ComplexStruct {
    n1: NestedOptionals;
    n2: NestedOptionals;
}

contract TestContract {
    co: ComplexStruct;

    init() {
        self.co = ComplexStruct{
            n1: NestedOptionals{a: 1, b: null, c: null},
            n2: NestedOptionals{a: null, b: true, c:"x"}
        };
    }

    receive() {}
}