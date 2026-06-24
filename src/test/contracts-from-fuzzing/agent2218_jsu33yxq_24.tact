struct Classic {
    flag: Bool;
}

contract Test {
    toggle: Classic;
    init() {
        self.toggle = Classic{flag:true};
    }
}