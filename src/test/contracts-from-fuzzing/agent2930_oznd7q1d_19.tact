struct InnerOptional {
    val: Int?;
}

struct MidOptional {
    io: InnerOptional?;
}

contract MidOptExample {
    mid: MidOptional;

    init() {
        self.mid = MidOptional{
            io: null
        };
    }
}
