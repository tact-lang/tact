struct SOptB {
    b: Bool?;
}

contract OptBoolDefaultNull {
    v: SOptB = SOptB{b: null};

    receive() {
        self.v = SOptB{b: false};
    }
}