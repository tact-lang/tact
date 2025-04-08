struct Sub {
    val: Int;
    opt: Bool?;
}

contract Test {
    subfield: Sub;
    flag: Bool;

    init() {
        self.subfield = Sub{
            val: 42,
            opt: true
        };
        self.flag = false;
    }
}