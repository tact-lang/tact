primitive Int;
primitive Bool;

struct NestedData {
    x: Int;
    y: Bool;
}

contract Test {
    opt: NestedData? as uint8;
    init() {
        self.opt = null;
    }
}

