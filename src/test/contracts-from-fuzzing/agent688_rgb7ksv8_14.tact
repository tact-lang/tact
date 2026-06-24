struct Info {
    num: Int = 5;
    flag: Bool?;
}

contract MixedAll {
    count: Int = 1;
    label: String = "label";
    info: Info;
    optionalInfo: Info?;

    init() {
        self.info = Info{ flag: true };
        self.optionalInfo = null;
    }
}
