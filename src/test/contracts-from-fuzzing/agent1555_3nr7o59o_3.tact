struct ManyOptionals {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

contract ManyOptionalsContract {
    big: ManyOptionals;

    init() {
        self.big = ManyOptionals{
            s1: null,
            s2: "hi",
            s3: null,
            s4: "hello",
            s5: null,
        };
    }

    receive() {
        // no-op
    }
}