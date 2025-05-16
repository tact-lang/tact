struct InheritA {
    a: Int;
}

struct InheritB {
    a: InheritA;
    b: Int;
}

struct InheritC {
    b: InheritB;
    c: Int;
}

contract NestedInheritance {
    x: InheritC;
    init() {
        self.x = InheritC{
            b: InheritB{
                a: InheritA{ a:1 },
                b:2
            },
            c:3
        };
    }
}