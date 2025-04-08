struct InnerStruct {
    x: Int;
    y: Int;
}

contract TestContract {
    s: InnerStruct;

    init() {
        self.s = InnerStruct{x: 1, y: 2};
    }
}