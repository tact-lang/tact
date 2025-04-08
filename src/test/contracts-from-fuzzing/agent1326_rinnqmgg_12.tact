struct Defaults {
    a: Int = 1;
    b: Bool = false;
}

contract OverwriteDefaults {
    field: Defaults;

    init() {
        self.field = Defaults{ a: 999, b: true };
    }

    receive() {
        let _ = self.field;
    }
}