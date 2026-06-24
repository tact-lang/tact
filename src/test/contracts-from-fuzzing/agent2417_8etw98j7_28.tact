struct Container {
    num: Int;
    flag: Bool;
    nested: InnerStruct;
}

struct InnerStruct {
    text: String;
    enabled: Bool?;
}

contract NestedComposite {
    big: Container;

    init() {
        self.big = Container{
            num: 8,
            flag: false,
            nested: InnerStruct{ text: "ok", enabled: null }
        };
    }
}
