struct Pair {
    first: Int;
    second: Int;
}

struct Wrapper {
    opt: Pair?;
}

contract TestOptional {
    data: Wrapper;

    init() {
        self.data = Wrapper{ opt: null };
    }
}