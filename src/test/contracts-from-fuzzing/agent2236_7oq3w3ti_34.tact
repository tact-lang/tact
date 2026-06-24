contract SerializationMix {
    big: Int as int257;
    med: Int as int128;
    small: Int as int32;
    tiny: Int as int8;
    flag: Bool;
    text: String;

    init() {
        self.big = 1;
        self.med = 2;
        self.small = 3;
        self.tiny = 4;
        self.flag = false;
        self.text = "hi";
    }
}