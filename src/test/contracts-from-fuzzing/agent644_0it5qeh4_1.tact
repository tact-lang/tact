struct Nested { val: Int; optVal: Bool?; }

contract Test {
    data: Nested;

    init() {
        self.data = Nested{val: 42, optVal: true};
    }
}