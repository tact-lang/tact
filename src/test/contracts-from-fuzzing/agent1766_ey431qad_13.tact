const CONST_INT: Int = 7;
const CONST_BOOL: Bool = true;

struct HasDefaults {
    x: Int = CONST_INT;
    y: Bool = CONST_BOOL;
}

contract StructWithDefaults {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}
