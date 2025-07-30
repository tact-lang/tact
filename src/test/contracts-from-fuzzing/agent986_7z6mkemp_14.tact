struct EmptyOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract NullableOnly {
    e: EmptyOpt;

    init() {
        self.e = EmptyOpt{ i:null, b:null, s:null };
    }
}
