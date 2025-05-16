struct Sub {
    detail: String;
    amount: Int;
}

contract TestContract {
    count: Int = 0;
    maybeInt: Int? = null;
    maybeStruct: Sub? = null;
    fixedStruct: Sub;

    init() {
        self.count = 1;
        self.maybeInt = null;
        self.maybeStruct = null;
        self.fixedStruct = Sub{detail:"x", amount:10};
    }
}