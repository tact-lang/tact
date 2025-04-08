struct Nested1 { val: Int; }

contract Test {
    data: Nested1;

    init() {
        self.data = Nested1{val: 1};
    }
}