struct CrossNested1 {
    a: Int;
    flag: Bool;
}

struct CrossNested2 {
    inner: CrossNested1;
    label: String;
}

contract CrossNested {
    state1: CrossNested1;
    state2: CrossNested2;

    init() {
        self.state1=CrossNested1{a:1,flag:true};
        self.state2=CrossNested2{inner:self.state1,label:"test"};
    }
}
