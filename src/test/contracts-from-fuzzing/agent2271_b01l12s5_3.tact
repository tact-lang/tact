struct OptionalInner {
    val: Int?;
    flag: Bool?;
}

contract OptionContract {
    st: OptionalInner;

    init() {
        self.st = OptionalInner{
            val: null,
            flag: true,
        };
    }
}