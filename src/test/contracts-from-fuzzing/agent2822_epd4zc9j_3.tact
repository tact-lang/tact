struct NestInner {
    x: Int;
}

struct NestOuter {
    y: NestInner;
}

contract NestedStorage {
    store: NestOuter;
    init() {
        self.store = NestOuter{ y: NestInner{ x: 42 } };
    }
}