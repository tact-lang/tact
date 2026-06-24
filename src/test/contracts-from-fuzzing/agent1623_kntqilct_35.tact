struct DefaultsAndOpts {
    a: Int = 8;
    b: Bool = true;
    c: Address?;
}

contract DefaultsVsOptional {
    data: DefaultsAndOpts;
    init() {
        self.data = DefaultsAndOpts{
            c: myAddress(),
        };
    }
}