struct SBase { x: Int; }

struct SWrapped { s: SBase; }

contract OptionalNestedStruct {
    data: SWrapped?;

    init() {
        self.data = null;
    }
}