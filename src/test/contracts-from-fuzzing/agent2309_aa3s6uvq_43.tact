// optional in struct, explicit zero default, deep nesting, trailing optionals
struct Deep {
    x: Int? = null;
}

struct Wrapper {
    d: Deep?;
}

contract DefaultedDeep {
    w: Wrapper?;
    init() {
        self.w = null;
    }
}