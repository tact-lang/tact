struct Basic {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract WideFields {
    f1: Int = 0;
    f2: Bool = false;
    f3: String = "";
    f4: Address;
    f5: Basic;

    init() {
        self.f4 = myAddress();
        self.f5 = Basic{ a:1, b:true, c:"x", d: myAddress() };
    }
}