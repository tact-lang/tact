struct DefaultsOpts {
    a: Int = 5;
    b: Bool = true;
    c: Address;
    d: String?;
}

contract DefaultsContract {
    data: DefaultsOpts;

    init() {
        self.data = DefaultsOpts{
            c: myAddress(),
            d: null,
        };
    }

    receive() {}
}
