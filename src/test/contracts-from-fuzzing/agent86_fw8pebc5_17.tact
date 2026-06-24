struct Level2 {
    val1: Int;
    optStr: String?;
}

struct Level1 {
    inner: Level2;
}

struct Holder {
    nested: Level1;
}

contract TestContract {
    hold: Holder;

    init() {
        self.hold = Holder{
            nested: Level1{
                inner: Level2{
                    val1: 123,
                    optStr: null,
                }
            }
        };
    }
}