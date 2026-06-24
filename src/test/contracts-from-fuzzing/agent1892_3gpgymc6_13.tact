struct Mix {
    a: Int;
    b: Bool;
    c: String?
}

contract MixTypes {
    m1: Mix;
    m2: Mix;

    init() {
        self.m1 = Mix{ a: -1, b: true, c: "abc" };
        self.m2 = Mix{ a: 0, b: false, c: null };
    }
}