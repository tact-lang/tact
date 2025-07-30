struct OptionalDeep {
    inner: Int?;
    flag: Bool?;
    text: String?;
    address: Address?;
}

contract TestContract {
    d: OptionalDeep?;

    init() {
        self.d = OptionalDeep{
            inner: 99,
            flag: true,
            text: "deep optionals",
            address: myAddress()
        };
    }
}