struct Inner { z: Int; }

struct Outer { innerOpt: Inner?; }

contract OptionalNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{ innerOpt: null };
    }
}