struct DeepOpt {
    val1: Int? = null;
    val2: Bool? = null;
    val3: Address? = null;
}

contract SomeSetSomeNull {
    nested: DeepOpt;

    init() {
        self.nested = DeepOpt{
            val1: 101,
            val2: null,
            val3: null
        };
    }

    receive() {
        let _ = self.nested;
    }
}