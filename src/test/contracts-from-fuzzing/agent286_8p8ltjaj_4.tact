struct OptNested {
    inner: Int?;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    data: OptNested;

    init() {
        self.data = OptNested{inner: null, flag: true, text: null};
    }
}