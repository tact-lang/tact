struct DefaultStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract StructDefaultField {
    foo: DefaultStruct;
    init() {
        self.foo = DefaultStruct{};
    }
}