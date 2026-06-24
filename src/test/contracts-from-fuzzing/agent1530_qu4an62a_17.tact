struct Sub {
    flag: Bool;
    name: String;
}

contract InitDefault {
    val: Int = 1;
    sub: Sub;

    init() {
        self.val = 2;
        self.sub = Sub{flag: true, name: "change"};
    }
}