struct OptInt {
    x: Int?;
}

struct Holder {
    o1: OptInt;
    o2: OptInt;
}

contract OptRepeatTest {
    h: Holder;

    init() {
        self.h = Holder{
            o1: OptInt{ x: null },
            o2: OptInt{ x: 5 }
        };
    }
}