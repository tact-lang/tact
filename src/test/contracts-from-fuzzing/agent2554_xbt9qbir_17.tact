struct Inside { x: Int; }

contract OptionalStruct {
    s: Inside?;

    init() {
        self.s = null;
    }
}