struct Wrapped {
    wrapped: Wrapper;
}

struct Wrapper {
    num: Int;
    flag: Bool;
}

contract StructOrdering {
    data: Wrapped;

    init() {
        self.data = Wrapped{
            wrapped: Wrapper{ num: 123, flag: false }
        };
    }
}