struct Deep3 {
    e: Int?;
}

struct Deep2 {
    d: Deep3?;
}

struct Deep1 {
    c: Deep2?;
}

contract DeepNestedOptionals {
    field: Deep1?;

    init() {
        self.field = null;
    }
}