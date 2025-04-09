struct Base {
    val: Int = 7;
}

contract OptionalStructField {
    baseOpt: Base?;

    init() {
        self.baseOpt = Base{
            val: 100
        };
    }
}