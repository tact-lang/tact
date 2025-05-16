struct OptNestInner {
    foo: Int?;
}

struct OptNestOuter {
    bar: OptNestInner?;
}

contract OptionalInsideOptional {
    val: OptNestOuter;

    init() {
        self.val = OptNestOuter{ bar: null };
    }
}
