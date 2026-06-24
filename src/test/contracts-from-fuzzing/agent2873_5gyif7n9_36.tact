struct Somewhere {
    flag: Bool;
}

contract DefaultStructAssign {
    s: Somewhere = Somewhere{flag:true};
    init() {
        self.s = Somewhere{flag:false};
    }
}