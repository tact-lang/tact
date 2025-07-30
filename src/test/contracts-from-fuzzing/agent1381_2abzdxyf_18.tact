struct BoolDefaultMix {
    a: Bool = true;
    b: Bool;
}

contract TestContract {
    data: BoolDefaultMix;

    init() {
        self.data = BoolDefaultMix{ b: false };
    }
}