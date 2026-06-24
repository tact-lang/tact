struct Nested1 {
    foo: Int;
    bar: Bool?;
}

contract DeepStorage {
    data: Nested1;

    init() {
        self.data = Nested1{foo: 1, bar: null};
    }
}