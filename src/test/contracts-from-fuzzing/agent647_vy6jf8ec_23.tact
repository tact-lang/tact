struct Optionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptDefaults {
    d: Optionals;

    init() {
        self.d = Optionals{ a:null, b:null, c:true };
    }
}