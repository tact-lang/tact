struct Nested {
    flag: Bool;
    count: Int;
}

contract TestContract {
    nestedField: Nested = Nested{flag: true, count: 5};

    init() {
        self.nestedField = Nested{flag: true, count: 5};
    }

    receive() {
        dump(self.nestedField.flag);
    }
}