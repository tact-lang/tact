struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    field: InnerStruct;

    init() {
        self.field = InnerStruct{a: 10, b: true, c: "ok"};
    }
}