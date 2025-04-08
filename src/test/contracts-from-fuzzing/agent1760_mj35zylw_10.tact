struct MyStruct {
    x: Int;
    y: Bool;
}

contract ManyOptionals {
    a: MyStruct?;
    b: Bool?;
    c: Int?;
    d: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = 42;
        self.d = null;
    }
}