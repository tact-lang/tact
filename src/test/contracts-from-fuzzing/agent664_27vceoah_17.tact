struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
}

contract MixOptBasic {
    data: Mix;

    init() {
        self.data = Mix{ a:1, b: true, c:"x", d:null };
    }
}
