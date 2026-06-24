struct ChildA { aa: Int }
struct ChildB { bb: String }
struct Parent {
    a: ChildA;
    b: ChildB;
}

contract MultiStructNested {
    root: Parent;
    init() {
        self.root = Parent{
            a: ChildA{ aa: 1 },
            b: ChildB{ bb: "hi" },
        };
    }
}