struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    val: InnerStruct;

    init() {
        self.val = InnerStruct{ a: 1, b: true };
    }
}