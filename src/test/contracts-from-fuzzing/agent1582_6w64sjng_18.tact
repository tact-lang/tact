struct RecA { b: RecB?; }
struct RecB { c: Int; }

contract NullableRecursivePointer {
    root: RecA;
    init() {
        self.root = RecA{b:null};
    }
}