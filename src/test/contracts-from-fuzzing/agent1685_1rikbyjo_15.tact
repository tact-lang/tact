struct HasString {
    s: String;
    n: Int;
}

contract StrContract {
    data: HasString;

    init() {
        self.data = HasString{
            s: "testing",
            n: 55
        };
    }
}
