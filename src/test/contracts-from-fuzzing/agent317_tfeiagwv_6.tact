struct Inner1 {
    v1: Int;
    v2: Bool;
}

struct Inner2 {
    v3: String;
    v4: Address;
}

struct NestedMix {
    one: Inner1;
    two: Inner2;
    optInt: Int?;
    optBool: Bool?;
}

contract MixedDeep {
    data: NestedMix;

    init() {
        self.data = NestedMix{
            one: Inner1{
                v1: 3,
                v2: false
            },
            two: Inner2{
                v3: "hello",
                v4: myAddress()
            },
            optInt: null,
            optBool: true,
        };
    }
}