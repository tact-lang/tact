struct Nester {
    s: Slice;
    c: Cell;
}

struct MiddleLayer {
    n: Nester;
    sVal: String;
    bVal: Bool;
}

contract DeeplyNestedSlices {
    payload: MiddleLayer;
    init() {
        let empty = emptyCell();
        self.payload = MiddleLayer{
            n: Nester{ s: empty.asSlice(), c: empty },
            sVal: "string",
            bVal: true
        };
    }
}