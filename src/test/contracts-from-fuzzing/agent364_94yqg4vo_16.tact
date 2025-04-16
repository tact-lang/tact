struct Details {
    name: String?;
    amount: Int;
}

contract MixedInitialize {
    id: Int = 42;
    info: Details;
    flag: Bool?;

    init() {
        self.info = Details{ name: null, amount: 777 };
        self.flag = null; // left null explicitly
    }
}