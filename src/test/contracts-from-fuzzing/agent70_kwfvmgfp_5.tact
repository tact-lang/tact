contract ManyTypes {
    a: Int = 1;
    b: Bool = false;
    c: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c") ;
    d: String = "test";

    init() {
        self.a = 42;
        self.b = true;
        self.c = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.d = "changed";
    }

    receive() {
        self.a = 99;
        self.b = false;
        self.d = "again";
    }
}