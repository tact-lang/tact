struct Contained {
    number: Int;
}

contract OptionalContractVar {
    var: Contained?;

    init() {
        self.var = null;
    }
}