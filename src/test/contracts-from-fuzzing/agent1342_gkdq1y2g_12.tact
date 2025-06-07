struct Sub {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyFields {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "str";
    e: Sub;
    f: Int? = null;
    g: String? = null;
    h: Bool? = null;

    init() {
        self.e = Sub{ a:10, b:false, c:"done" };
    }
}