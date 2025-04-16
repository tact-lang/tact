struct InnerLevel {
    b: Bool?;
    s: String?;
}

struct OuterLevel {
    i: Int?;
    nested: InnerLevel?;
}

contract MultiLevelOptionals {
    data: OuterLevel?;

    init() {
        self.data = OuterLevel{ i:null, nested: InnerLevel{ b:null, s:null } };
    }
}