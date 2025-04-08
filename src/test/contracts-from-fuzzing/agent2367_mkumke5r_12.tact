struct OptStrBool {
    s: String?;
    b: Bool?;
}

struct OptStrBoolLayer2 {
    nested: OptStrBool?;
}

contract PartialNestedOpt {
    state: OptStrBoolLayer2;

    init() {
        self.state = OptStrBoolLayer2{ nested: OptStrBool{ s: null, b: null } };
    }
}