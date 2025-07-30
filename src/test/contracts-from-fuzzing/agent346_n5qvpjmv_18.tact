struct ContainString {
    message: String;
    flag: Bool;
}

contract StructWithString {
    data: ContainString;

    init() {
        self.data = ContainString{
            message: "Hello",
            flag: true
        };
    }
}