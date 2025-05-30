// struct with deeply nested optionals nested inside persistent state
struct DeepOpt {
    foo: Int?;
    bar: Bool?;
}

struct Wrap {
    deep: DeepOpt?;
}

contract NestedOptWrap {
    w: Wrap;

    init() {
        self.w = Wrap{ deep: null };
    }
}