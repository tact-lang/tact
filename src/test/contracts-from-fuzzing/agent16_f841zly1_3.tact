struct Conf {
    val1: Int;
    val2: Bool?;
    val3: Address;
}

contract NestedFields {
    conf: Conf;
    flag: Bool = false;

    init() {
        self.conf = Conf{
            val1: 42,
            val2: null,
            val3: myAddress(),
        };
    }

    receive() {}
}