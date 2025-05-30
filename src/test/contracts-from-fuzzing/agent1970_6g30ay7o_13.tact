struct OptionalInOptional {
    val: Int?;
}

contract DoubleOptionals {
    wrapper: OptionalInOptional?;

    init() {
        self.wrapper = OptionalInOptional{ val:null };
    }
}