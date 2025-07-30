struct HasOption {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract ConcreteAndOption {
    x: Int = 5;
    y: Bool = true;
    z: String = "hi";
    opt: HasOption;

    init() {
        self.opt = HasOption{ a:null, b:null, s:null };
    }
}
