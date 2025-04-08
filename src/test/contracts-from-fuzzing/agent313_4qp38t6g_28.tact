struct NestedMix {
    x: Int;
    s: String;
}

struct AnotherMix {
    mix: NestedMix;
    b: Bool;
}

contract MixedNestedFieldsTest {
    nestedVal: AnotherMix;

    init() {
        self.nestedVal = AnotherMix{mix: NestedMix{x:7,s:"s"}, b:true};
    }
}