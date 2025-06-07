struct Mix {
    a: Int?;
    b: Bool;
    c: Int?;
    d: Bool;
}

contract TestContract {
    info: Mix;

    init() {
        self.info = Mix{ a: null, b: true, c: null, d: false };
    }
}