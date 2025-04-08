struct DefaultMix {
    i: Int = 5;
    o: Int?;
    s: String = "hi";
    os: String?;
}

contract MixedDefaults {
    val: DefaultMix;

    init() {
        self.val = DefaultMix{ o:null, os:null };
    }
}