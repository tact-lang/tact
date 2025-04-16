// Deep nesting with optional
struct LV3 {
    val: String;
}

struct LV2 {
    child: LV3?;
}

struct LV1 {
    node: LV2;
}

contract OptDeepNest {
    root: LV1;

    init() {
        self.root = LV1{
            node: LV2{
                child: null,
            }
        };
    }
}