struct ManyDefaults {
    intVal: Int = 42;
    boolVal: Bool = true;
    strVal: String = "default";
}

contract TestContract {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{
            intVal: 7,
            boolVal: false,
            strVal: "overridden"
        };
    }

    receive() {
        let _ = self.data.boolVal;
    }
}