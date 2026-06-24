struct NestOpt {
    i: Int?;
    s: String?;
}

struct Top {
    a: Int;
    b: String;
    c: NestOpt?;
}

contract OptionalStructNested {
    data: Top?;

    init() {
        self.data = null;
    }
}