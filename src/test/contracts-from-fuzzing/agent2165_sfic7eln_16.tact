struct NestOpt {
    a: Int;
    b: Bool?;
    c: String;
}

contract MixedInit {
    f1: Int;
    f2: Bool?;
    f3: NestOpt;

    init() {
        self.f1 = 1;
        self.f2 = null;
        self.f3 = NestOpt{
            a: 42,
            b: true,
            c: "yo"
        };
    }
}