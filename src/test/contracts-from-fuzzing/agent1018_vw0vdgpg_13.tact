struct Deep {
    num: Int;
}

contract OptionalNested {
    d: Deep?;
    flag: Bool;

    init() {
        self.d = null;
        self.flag = true;
    }
}