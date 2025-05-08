struct SimpleStruct { a: Int; }

contract TestContract {
    s: SimpleStruct;

    init() {
        self.s = SimpleStruct{a: 42};
    }
}