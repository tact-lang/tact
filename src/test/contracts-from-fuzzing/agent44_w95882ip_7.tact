struct Nested {
    ids: map<Int, Int>;
}

struct Complex {
    n: Int;
    cellOpt: Cell?;
    values: map<Int, Int>;
    nestedOpt: Nested?;
}

contract TestContract {
    store: Complex;

    init() {
        self.store = Complex{
            n: 99,
            cellOpt: null,
            values: emptyMap(),
            nestedOpt: null
        };
    }

    receive() {
        let n = self.store.n;
    }
}
