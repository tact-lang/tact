struct DefaultsAndOpts {
    a: Int = 0;
    b: Bool?;
}

contract DefaultsOptionalStruct {
    val: DefaultsAndOpts;

    init() {
        self.val = DefaultsAndOpts{
            b: null
        };
    }
}