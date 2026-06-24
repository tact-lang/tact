struct Middle {
    left: Int?;
    right: Bool;
    flag: Bool?;
}

contract NestedOpt {
    inner: Middle;

    init() {
        self.inner = Middle{left:null, right:true, flag:null};
    }
}