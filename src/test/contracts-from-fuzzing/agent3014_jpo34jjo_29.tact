// Contract with a persistent tuple-like struct
struct Pair {
    x: Int;
    y: Bool;
}

contract TupleStruct {
    data: Pair;

    init() {
        self.data = Pair{ x:10, y:true };
    }
}