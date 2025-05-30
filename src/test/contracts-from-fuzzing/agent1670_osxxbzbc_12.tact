struct OptionalDeep {
    s1: Int?;
    s2: Bool?;
    s3: String?;
    s4: Cell?;
}

struct ContainOpt {
    f: OptionalDeep;
    x: Int;
}

contract NestedOptionalContainer {
    state: ContainOpt;

    init() {
        self.state = ContainOpt{ f: OptionalDeep{ s1:null, s2:true, s3:null, s4:null }, x: 123 };
    }
}