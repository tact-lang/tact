// composite persistent storage with nested optional structs containing optional primitives
struct Deep {
    foo: Int?;
    bar: Bool?;
}

struct Wrapper {
    deep: Deep?;
    extra: Int;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper {
            deep: null,
            extra: 555,
        };
    }
}
