struct Nested1 {
    inner: Int;
}

contract Test1 {
    data: Nested1;
    init() {
        self.data = Nested1{inner: 10};
    }
}