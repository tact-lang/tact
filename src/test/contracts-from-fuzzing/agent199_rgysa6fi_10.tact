struct Struct1 { a: Int; }
struct Struct2 { b: Int; }
struct Struct3 { c: Int; }

struct Composite {
    f1: Struct1;
    f2: Struct2;
    f3: Struct3;
}

contract MultipleNestedStructs {
    data: Composite;

    init() {
        self.data = Composite{
            f1: Struct1{a: 1},
            f2: Struct2{b: 2},
            f3: Struct3{c: 3},
        };
    }
}
