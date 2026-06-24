struct OptField {
    flag: Bool?;
    num: Int;
}

contract MultiOpt {
    of1: OptField?;
    of2: OptField?;
    of3: OptField?;

    init() {
        self.of1 = null;
        self.of2 = OptField{ flag: true, num: 10 };
        self.of3 = null;
    }
}