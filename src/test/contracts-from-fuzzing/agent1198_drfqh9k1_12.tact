struct Bag {
    val1: Int;
    val2: String?;
    val3: Bool;
    val4: Address?;
}

contract ImplicitNullOpt {
    data: Bag;

    init() {
        self.data = Bag{
            val1: 5,
            val2: null,
            val3: true,
            val4: null
        };
    }

    receive() {
        self.data = self.data;
    }
}