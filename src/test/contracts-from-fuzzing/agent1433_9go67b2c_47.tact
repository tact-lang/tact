struct ManyNested {
    a: Int?;
    b: Int?;
    c: String?;
}

struct MidNested {
    m: ManyNested?;
}

struct OuterNested {
    o: MidNested?;
}

contract MultiLevelOptional {
    data: OuterNested;

    init() {
        self.data = OuterNested{ o: null };
    }
}
