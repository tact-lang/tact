struct Wrapped {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullOptionalDefaults {
    val: Wrapped;

    init() {
        self.val = Wrapped{a:null, b:null, c:null};
    }
}