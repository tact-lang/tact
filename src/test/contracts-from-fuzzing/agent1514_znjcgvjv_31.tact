struct ChildA { a: Int }
struct ChildB { b: Bool }
struct ChildC { c: String }

struct Parent {
    f1: ChildA;
    f2: ChildB;
    f3: ChildC;
}

contract NestedMultipleStructs {
    s: Parent;

    init() {
        self.s = Parent{
            f1: ChildA{ a:1 },
            f2: ChildB{ b:true },
            f3: ChildC{ c:"ok" }
        };
    }
}