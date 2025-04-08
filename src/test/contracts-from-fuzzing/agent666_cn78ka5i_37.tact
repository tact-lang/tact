struct Strange { a:Int?; b:Int; c:Int?; }

contract Strict {
    s:Strange;

    init() {
        self.s=Strange{a:null,b:1,c:2};
    }
}
