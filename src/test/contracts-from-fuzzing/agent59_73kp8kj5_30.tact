struct Base {
    f1: Int;
    f2: Int;
}

struct ContainsBase {
    a: Base;
    b: Base;
    c: Base;
}

contract ReusedStructs {
    val: ContainsBase;
    init() {
        self.val = ContainsBase{
            a: Base { f1: 1, f2: 2 },
            b: Base { f1: 3, f2: 4 },
            c: Base { f1: 5, f2: 6 }
        };
    }
}
