struct OptionalInner {
    val: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalStructFields {
    nestedOpt: OptionalInner;

    init() {
        self.nestedOpt = OptionalInner{
            val: null,
            flag: null,
            text: null
        };
    }
}