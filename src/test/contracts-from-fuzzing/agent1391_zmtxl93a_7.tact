struct AllOptions {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract PureOptionals {
    f: AllOptions;

    init() {
        self.f = AllOptions{ a:null, b:null, c:null };
    }
}