struct InnerOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract InnerOptionalsStorage {
    stored: InnerOptionals;

    init() {
        self.stored = InnerOptionals{
            a: null,
            b: null,
            c: "init"
        };
    }

    receive() {
        if (self.stored.a == null) {
            self.stored.a = 10;
        } else {
            self.stored.a = self.stored.a!! + 1;
        }
    }
}