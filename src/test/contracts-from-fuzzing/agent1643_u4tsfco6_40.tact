// nested optional of nested optional (single level allowed)
struct NestOpt2 {
    foo: Int?;
}

struct NestOpt1 {
    bar: NestOpt2?;
}

contract NestedOptionals {
    s: NestOpt1?;

    init() {
        self.s = null;
    }
}