struct TailDefaults {
    a: Int;
    b: Bool = false;
    c: String? = null;
}

contract TailDef {
    val: TailDefaults;

    init() {
        self.val = TailDefaults{
            a: 55
        };
    }
}
