struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

struct ContainerOptionalMix {
    nested1: OptionalMix?;
    nested2: OptionalMix;
}

contract OptionalMixTest {
    data: ContainerOptionalMix;
    init() {
        self.data = ContainerOptionalMix{
            nested1: null,
            nested2: OptionalMix{
                a: 5,
                b: null,
                c: myAddress(),
                d: "str"
            }
        };
    }
}