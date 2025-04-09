struct OptionalInner {
    val: Int?;
}

contract TestContract {
    optInner: OptionalInner?;

    init() {
        self.optInner = OptionalInner{
            val: null
        };
    }
}