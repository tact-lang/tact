contract NamedStructWithManyOptions {
    record: RecOpt;

    init() {
        self.record = RecOpt{ a:null, b:null, c:null };
    }
}

struct RecOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}