struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{ a: 7, b: true };
    }
}