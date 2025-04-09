struct SInner {
    val: Int;
}

struct SOuter {
    inn: SInner?;
    flag: Bool;
}

contract NullableMiddle {
    data: SOuter;

    init() {
        self.data = SOuter{
            inn: SInner{val: 10},
            flag: false
        };
    }
}