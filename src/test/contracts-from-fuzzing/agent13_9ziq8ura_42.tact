struct DefaultStruct {
    a: Int = 42;
    b: Bool = false;
}

contract InitializedDefaults {
    d: DefaultStruct;

    init() {
        self.d = DefaultStruct{ a:10, b:true };
    }
}