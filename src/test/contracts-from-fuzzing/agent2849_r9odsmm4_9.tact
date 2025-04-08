struct OptionalDeep {
    inner: Int?;
    text: String?;
    booly: Bool?;
}

struct Wrap {
    inside: OptionalDeep?;
    flag: Bool;
}

contract NestedOptionals {
    stuff: Wrap;
    
    init() {
        self.stuff = Wrap{
            inside: null,
            flag: true
        };
    }
}