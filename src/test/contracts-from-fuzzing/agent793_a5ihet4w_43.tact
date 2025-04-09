struct DeepOpt {
    a: Int?;
    sub: SubOpt;
}

struct SubOpt {
    b: Int?;
    flag: Bool;
}

contract TestContract {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{a:null, sub:SubOpt{b:null, flag:true}};
    }

    receive() {}
}