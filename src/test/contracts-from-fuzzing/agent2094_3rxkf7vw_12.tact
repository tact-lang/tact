struct Inner {
    val: Int;
    flag: Bool?;
    txt: String;
}

contract NestedInit {
    data: Inner;
    init() {
        self.data = Inner{ val: 55, flag: null, txt: "tact" };
    }
    receive() {}
}
