struct InnerStr {
    s: String;
}

contract StringInside {
    i: InnerStr = InnerStr{ s:"sss" };

    init() {
        self.i = self.i;
    }

    receive() {
        self.i = self.i;
    }
}