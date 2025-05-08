struct Longer {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Bool?;
    val5: Int?;
    val6: String?;
}

contract MuchData {
    s: Longer;

    init() {
        self.s = Longer{
            val1: 55,
            val2: true,
            val3: "hi",
            val4: null,
            val5: null,
            val6: null,
        };
    }
}