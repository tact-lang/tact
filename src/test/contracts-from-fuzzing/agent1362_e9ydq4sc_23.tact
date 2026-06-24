struct NestedOptDefaults {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract Test {
    field: NestedOptDefaults;

    init() {
        self.field = NestedOptDefaults{
            x:1,
            y:true,
            z:"test"
        };
    }

    receive() {}
}