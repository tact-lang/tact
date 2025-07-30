struct SingleBool {
    b: Bool;
}

contract OneBit {
    data: SingleBool;

    init() {
        self.data = SingleBool{ b: false };
    }
}