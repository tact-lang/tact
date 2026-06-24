struct Compose {
    foo: Int;
    bar: Bool;
}

contract MixReuseFields {
    a: Compose;
    b: Compose;

    init() {
        self.a = Compose{ foo: 1, bar: true };
        self.b = Compose{ foo: 2, bar: false };
    }
}