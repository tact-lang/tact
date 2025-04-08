struct OptionNested {
    x: Int?;
    y: InnerO?;
}

struct InnerO {
    s: String?;
    b: Bool?;
}

contract OptionalStructRecursive {
    storage: OptionNested;
    init() {
        self.storage = OptionNested{ x: null, y: InnerO{ s:null, b:null } };
    }
}