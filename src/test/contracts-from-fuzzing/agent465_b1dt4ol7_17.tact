// Mix deeply nested structs + optional struct at inner level
struct DeepInner {
    detail: String;
    code: Int;
}

struct MiddleOptional {
    info: DeepInner?;
    flag: Bool;
}

struct Top {
    layer: MiddleOptional;
    note: String;
}

contract TestContract {
    store: Top;

    init() {
        self.store = Top{
            layer: MiddleOptional{ info: null, flag: true },
            note: "done",
        };
    }
}
