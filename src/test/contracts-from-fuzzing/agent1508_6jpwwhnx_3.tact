struct OptionalInner {
    val: Int?;
    flag: Bool?;
}

contract TestContract {
    optNested: OptionalInner;

    init() {
        self.optNested = OptionalInner{
            val: null,
            flag: true
        };
    }
}