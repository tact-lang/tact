struct X {
    val: Int;
    str: String;
    flag: Bool;
}

// Test many initialized nested struct assignments
contract ManyInits {
    a: X; b: X; c: X; d: X;

    init() {
        self.a = X{val:1, str:"a", flag:true};
        self.b = X{val:2, str:"b", flag:false};
        self.c = X{val:3, str:"c", flag:true};
        self.d = X{val:4, str:"d", flag:false};
    }
}
