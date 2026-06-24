// deeply nested optional containing nested struct which contains optional
struct LeafWithOpt {
    val: Int?;
}

struct MiddleOpt {
    leaf: LeafWithOpt;
}

contract DeepOpt {
    field: MiddleOpt?;

    init() {
        self.field = null;
    }
}