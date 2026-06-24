struct Sub {
    flag: Bool = true;
    count: Int;
    text: String?;
}

contract MixedDefaults {
    data: Sub;

    init() {
        self.data = Sub{
            count: 3,
            text: null
        };
    }
}