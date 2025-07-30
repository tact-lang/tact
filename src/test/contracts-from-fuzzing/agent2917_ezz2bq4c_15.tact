struct SChild {
    a: Int;
    b: Bool;
    c: String;
}

struct SParent {
    sx: SChild;
    sy: SChild;
}

contract NestedStructsStorage {
    final: SParent;

    init() {
        self.final = SParent{
            sx: SChild{a: 1, b: true, c: "hi"},
            sy: SChild{a: 2, b: false, c: "bye"},
        };
    }
}
