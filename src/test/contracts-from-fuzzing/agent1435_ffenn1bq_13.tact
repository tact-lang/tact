struct Hello {
    msg: String?;
    nested: C?;
}

struct C {
    val: Int;
}

contract ComboOpt {
    storage: Hello;

    init() {
        self.storage = Hello{
            msg: null,
            nested: null
        };
    }
}