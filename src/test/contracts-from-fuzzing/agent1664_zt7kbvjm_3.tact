struct Details {
    address: String;
    phone: String?;
}

contract NestedOptionalAssigned {
    info: Details?;

    init() {
        self.info = Details{
            address: "Moon Base",
            phone: "12345"
        };
    }
}