contract ManyTypes {
    a: Int as uint8 = 5;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: String? = null;
    f: Bool? = true;
    receive() {
        let _ = self.b;
    }
}