struct EmptyOptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptDefaults {
    data: EmptyOptDefaults;
    init() {
        self.data = EmptyOptDefaults{
            a:null,
            b:null,
            c:null,
        };
    }
}