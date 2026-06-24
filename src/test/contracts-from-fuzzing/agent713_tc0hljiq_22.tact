struct Mix {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract MixNulls {
    f: Mix;
    init() {
        self.f = Mix{ s: null, b: null, i: null };
    }
}