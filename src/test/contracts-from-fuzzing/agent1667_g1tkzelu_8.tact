struct InnerMost {
    z: Bool;
}

struct MidLevel {
    y: InnerMost?;
}

struct Outer {
    x: MidLevel?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{ x:null };
    }
}
