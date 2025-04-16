struct SOpt {
    value: Int?;
}

contract OptOfStruct {
    s: SOpt?;
    init() {
        self.s = null;
    }
    receive() {
        if (self.s != null) {
            let _ = self.s!!;
        }
    }
}