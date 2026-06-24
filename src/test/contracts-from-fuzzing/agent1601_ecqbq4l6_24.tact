struct Pair {
    val1: Int;
    val2: Bool;
}

contract PairContract {
    pair: Pair;
    init() {
        self.pair = Pair{ val1:1, val2:true };
    }
}