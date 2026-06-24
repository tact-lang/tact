struct InnerStruct {
    a: Int;
    b: String;
}

contract TestContract {
    f1: Int;
    f2: Bool?;
    f3: String;
    f4: InnerStruct;

    init() {
        self.f1 = 1;
        self.f2 = null;
        self.f3 = "hello";
        self.f4 = InnerStruct{ a: 5, b: "bye"};
    }
}