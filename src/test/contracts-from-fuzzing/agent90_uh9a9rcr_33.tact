struct SerialMix {
    a: Int as uint4;
    b: Int;
    c: Int as uint5;
    d: Int;
    e: Int as coins;
}

contract SerialMixContract {
    data: SerialMix;
    init() {
        self.data = SerialMix{ a:1, b:2, c:3, d:4, e:5 };
    }
}