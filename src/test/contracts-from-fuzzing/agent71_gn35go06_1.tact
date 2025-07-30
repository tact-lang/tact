struct SimpleStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: SimpleStruct;

    init() {
        self.data = SimpleStruct{a: 1, b: true};
    }
}