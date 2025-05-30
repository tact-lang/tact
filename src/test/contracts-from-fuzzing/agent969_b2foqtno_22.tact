struct Info {
    label: String;
    amount: Int;
}

contract MixPrimitiveStruct {
    x: Int;
    y: Bool;
    info: Info;

    init() {
        self.x = 10;
        self.y = false;
        self.info = Info{
            label: "mix",
            amount: 42
        };
    }
}
