struct Mix {
    small: Int as uint8;
    flag: Bool;
    str: String;
}

contract SerializeMixed {
    m: Mix;

    init() {
        self.m = Mix{
            small: 20,
            flag: false,
            str: "hi"
        };
    }
}