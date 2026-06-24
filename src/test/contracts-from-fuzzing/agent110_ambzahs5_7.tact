struct ChildStruct { a: Int?; b: Int; }
struct ParentStruct { c: ChildStruct?; d: Int; }

contract OptionalNestedStructField {
    s: ParentStruct;

    init() {
        self.s = ParentStruct{ c: null, d:1 };
    }

    receive() {
        let _ = self.s;
    }
}