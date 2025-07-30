struct BigNestedDefaults {
    a: Int = 1;
    b: String = "hi";
    c: Bool?;
}

struct Wrap {
    nested: BigNestedDefaults;
    label: String?;
}

contract NestedDefaultsInState {
    rec: Wrap;

    init() {
        self.rec = Wrap{
            nested: BigNestedDefaults{},
            label: null
        };
    }
}