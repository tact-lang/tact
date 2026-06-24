struct Nested {
    x: Int;
    y: Int?;
}

struct Wrapper {
    inner: Nested;
    flag: Bool;
}

contract TestContract {
    item: Wrapper;
    init() {
        self.item = Wrapper{inner: Nested{x: 5, y: null}, flag: true};
    }
}