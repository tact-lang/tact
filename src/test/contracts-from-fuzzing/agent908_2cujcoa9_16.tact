struct StringAddressStruct {
    label: String?;
    destination: Address?;
    memo: String;
}

contract OptionalStringAddr {
    sa: StringAddressStruct;

    init() {
        self.sa = StringAddressStruct{
            label: null,
            destination: null,
            memo: "test"
        };
    }
}