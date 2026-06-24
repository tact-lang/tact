// test contract persistent field optional slices
contract OptionalStorage {
    foo: Slice?;
    bar: Cell?;
    init() {
        self.foo = null;
        self.bar = null;
    }
}