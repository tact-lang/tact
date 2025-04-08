// Slightly deepen nesting level and use reference types
struct InnerMost {
    label: String;
    flag: Bool;
}

struct MiddleNest {
    detail: InnerMost;
    number: Int;
}

contract DeepWithRefs {
    data: MiddleNest;

    init() {
        self.data = MiddleNest{
            detail: InnerMost{
                label:"hi",
                flag:true,
            },
            number:123,
        };
    }
}
