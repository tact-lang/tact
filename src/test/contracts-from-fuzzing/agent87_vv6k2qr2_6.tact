struct Defaulted {
    foo: Int = 10;
    bar: Int?;
}

contract DefaultedStruct {
    s: Defaulted;

    init() {
        self.s = Defaulted{}; // uses struct defaults
    }
}
