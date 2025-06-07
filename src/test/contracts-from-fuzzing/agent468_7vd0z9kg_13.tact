// Contract with persistent tuple-like struct
struct Pair {
    x: Int;
    y: Int;
}

contract PairStore {
    pair: Pair;
    flag: Bool;

    init() {
        self.pair = Pair{ x: 11, y: 22 };
        self.flag = true;
    }
}