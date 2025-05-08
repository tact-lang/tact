struct HasConstDefault {
    a: Int;
    b: String = "hello";
    c: Bool = true;
}

contract DefaultInStruct {
    s: HasConstDefault;

    init() {
        self.s = HasConstDefault{ a:42 };
    }
}