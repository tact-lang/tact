struct DeepStrings {
    a: String;
    b: Mid;
}

struct Mid {
    c: String;
    d: Inner;
}

struct Inner {
    e: String;
}

contract VeryStringy {
    s: DeepStrings;

    init() {
        self.s = DeepStrings{
            a:"A",
            b: Mid{
                c:"C",
                d: Inner{
                    e:"E"
                }
            }
        };
    }
}