struct NestedOptional {
    payload: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructInsideOptional {
    outer: NestedOptional?;

    init() {
        self.outer = null;
    }

    receive() {
        let _ = self.outer;
    }
}
