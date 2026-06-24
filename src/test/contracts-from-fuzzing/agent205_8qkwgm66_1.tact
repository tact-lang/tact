struct DeepInner {
    q: Int?;
    w: String;
}

struct MidLevel {
    x: Int;
    y: Bool?;
    inner: DeepInner;
}

contract NestedOptionalFields {
    meta: MidLevel;
    
    init() {
        self.meta = MidLevel{
            x: 1,
            y: null,
            inner: DeepInner{
                q: null,
                w: "test"
            }
        };
    }
}