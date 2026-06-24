struct NestedManyOption {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Level2?;
}

struct Level2 {
    e: Int?;
    f: Bool?;
    g: Level3?;
}

struct Level3 {
    h: Int?;
    i: String?;
}

contract DeepManyOption {
    data: NestedManyOption;

    init() {
        self.data = NestedManyOption{
            a:null, b:null, c:null, d:null
        };
    }
}