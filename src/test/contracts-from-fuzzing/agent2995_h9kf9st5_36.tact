struct DefaultsAndOpts {
    a: Int = 1;
    b: Int?;
    c: String? = null;
}

contract DefaultsOpts {
    val: DefaultsAndOpts;

    init() {
        self.val = DefaultsAndOpts{
            a: 2,
            b: null,
            c: null
        };
    }
}