struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

contract DefaultsInStruct {
    state: DefaultVals;
    init() {
        self.state = DefaultVals{a:1,b:true,c:"abc"};
    }
}