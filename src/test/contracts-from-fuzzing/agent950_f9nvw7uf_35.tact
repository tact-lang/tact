// optional struct containing bool and string optionals
struct ContainMix {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract FlatStructMix {
    foo: ContainMix?;

    init() {
        self.foo = null;
    }
}