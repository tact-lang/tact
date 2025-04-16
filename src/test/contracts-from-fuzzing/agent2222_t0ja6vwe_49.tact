struct Opt {
    a: Int?;
    b: Bool?;
}

contract OptFields {
    x: Int = 1;
    y: Opt;

    init() {
        self.y = Opt{ a:null, b:null };
    }
}