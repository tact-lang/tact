struct DefaultPersistent {
    a: Int = 3;
    b: Bool = false;
    c: String = "hey";
    d: Address;
}

contract DefaultedState {
    data: DefaultPersistent;

    init() {
        self.data = DefaultPersistent{
            d: myAddress()
        };
    }
}