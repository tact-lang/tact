struct Inner {
    a: Int;
    b: Bool;
}

contract FieldsDefault {
    val1: Int = 42;
    val2: Bool = false;
    val3: Inner = Inner{ a:1, b:true };

    init() {
        self.val1 = 100;
        self.val2 = true;
        self.val3 = Inner{ a:5, b:false };
    }
}