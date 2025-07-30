struct InnerA { x: Int; y: Int; }

contract PersistNestedStruct {
    s: InnerA;

    init() {
        self.s = InnerA{ x: 7, y: 11 };
    }
}