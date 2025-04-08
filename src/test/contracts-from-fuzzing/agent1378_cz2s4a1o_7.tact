struct OptNest {
    innerOpt: Int?;
    optBool: Bool?;
    name: String;
}

contract OptNested {
    o: OptNest = OptNest{innerOpt:null, optBool:null, name:"hi"};
    init() {
        self.o = OptNest{innerOpt:1, optBool:true, name:"hello"};
    }
    receive() {}
}