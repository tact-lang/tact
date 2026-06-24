struct OptionalInner {
    number: Int?;
    flag: Bool?;
}

contract OptionalsInStorage {
    inner: OptionalInner;

    init() {
        self.inner = OptionalInner{
            number: null,
            flag: true,
        };
    }
}