struct SOpt {
    foo: Int?;
}

contract OptWithDefaultInit {
    s: SOpt;

    init() {
        self.s = SOpt{ foo: null };
    }
}
