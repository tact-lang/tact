struct Deep {
    flag: Bool;
    num: Int;
}

struct Wrap {
    inner: Deep?;
}

contract OptionalStructInsideOptional {
    container: Wrap?;

    init() {
        self.container = null;
    }
}
