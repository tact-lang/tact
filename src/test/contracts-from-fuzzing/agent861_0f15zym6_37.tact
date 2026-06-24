struct OptionalS {
    text: String?;
    num: Int?;
    flag: Bool?;
}

contract ManyOptionals {
    data: OptionalS;

    init() {
        self.data = OptionalS{};
    }

    receive() {
        let _ = self.data;
    }
}