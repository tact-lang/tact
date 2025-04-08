struct Mix {
    a: Int;
    b: Bool?;
    c: Int;
    d: Bool?;
    e: Int;
    f: Bool?;
}

contract TestContract {
    mixed: Mix;

    init() {
        self.mixed = Mix{
            a: 1,
            b: null,
            c: 2,
            d: true,
            e: 3,
            f: false
        };
    }

    receive() {
        let _ = self.mixed.e;
    }
}