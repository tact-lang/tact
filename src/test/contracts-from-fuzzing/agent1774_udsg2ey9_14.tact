struct DeepAndWide {
    layer1: Int;
    layer2: Struct2;
}

struct Struct2 {
    foo: Bool;
    layer3: Struct3;
}

struct Struct3 {
    bar: Address;
    layer4: Struct4;
}

struct Struct4 {
    done: Bool;
    endVal: Int;
}

contract Test {
    combined: DeepAndWide;

    init() {
        self.combined = DeepAndWide{
            layer1: 1,
            layer2: Struct2{
                foo: true,
                layer3: Struct3{
                    bar: myAddress(),
                    layer4: Struct4{
                        done: false,
                        endVal: 99,
                    },
                },
            },
        };
    }
}