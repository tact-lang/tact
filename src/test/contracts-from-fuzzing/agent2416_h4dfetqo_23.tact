struct HasOptionals {
    val: Int?;
    val2: Int? = null;
}

contract NestedOptionals {
    s: HasOptionals;

    init() {
        self.s = HasOptionals{
            val: 42,
            val2: null
        };
    }
}