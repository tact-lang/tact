struct DeeplyNested {
    layer1: Bool;
    layer2: Layer2;
}

struct Layer2 {
    flag: Bool;
    layer3: Layer3;
}

struct Layer3 {
    value: Int;
    maybeString: String?;
}

contract TestContract {
    dn: DeeplyNested;

    init() {
        self.dn = DeeplyNested{
            layer1: true,
            layer2: Layer2{
                flag: false,
                layer3: Layer3{ value: 10, maybeString: null }
            }
        };
    }
}