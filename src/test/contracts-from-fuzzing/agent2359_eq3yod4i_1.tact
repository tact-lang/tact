struct NestedPoint {
    x: Int as int64;
    y: Int as int64;
}

struct DeepParams {
    label: String = "Origin";
    active: Bool = true;
    pos: NestedPoint;
    optPos: NestedPoint?;
}

contract DeepStorage {
    meta: DeepParams;

    init() {
        self.meta = DeepParams{
            pos: NestedPoint{ x: 0, y: 0 },
            optPos: null
        };
    }
}
