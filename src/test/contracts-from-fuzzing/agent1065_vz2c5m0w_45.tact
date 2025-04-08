struct MixPrimOptString {
    x: Int;
    y: Bool?;
    z: String;
}

contract MixPrimOptStringContract {
    data: MixPrimOptString;

    init() {
        self.data = MixPrimOptString{
            x: 5,
            y: null,
            z: "qwerty"
        };
    }
}
