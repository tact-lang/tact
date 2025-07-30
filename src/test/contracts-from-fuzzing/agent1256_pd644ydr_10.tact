message(100) Msg1 { a: Int; }
message(101) Msg2 { b: Bool; }

struct Complex {
    m1: Msg1;
    m2: Msg2;
    flag: Bool?;
}

contract EmbedMessages {
    data: Complex;

    init() {
        self.data = Complex {
            m1: Msg1{a: 10},
            m2: Msg2{b: true},
            flag: null
        };
    }
}
