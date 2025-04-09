// Testing optional struct inside defaulted optional
struct InnerX {
    n: Int;
}

contract DoubleOptDefault {
    i: InnerX?;

    init() {
        self.i = null;
    }
}