struct Info {
    label: String;
    owner: Address;
}

contract CompositePrims {
    x: Info;

    init() {
        self.x = Info{
            label: "test",
            owner: myAddress()
        };
    }
}
