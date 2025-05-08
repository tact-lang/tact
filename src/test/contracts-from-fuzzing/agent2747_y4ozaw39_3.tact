struct OptionalInner {
    val: Int?;
    name: String?;
}

contract OptNested {
    oi: OptionalInner;

    init() {
        self.oi = OptionalInner{
            val: null,
            name: null
        };
    }
}