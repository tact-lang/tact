struct Inner {
    x: Int;
    y: Bool;
}

contract UseStruct {
    myStruct: Inner;
    init() {
        self.myStruct = Inner{x: 4, y: false};
    }
}