struct OddCase {
    a: Int?;
    b: Int;
    c: Int?;
}

contract MiddleReq {
    data: OddCase;
    init() {
        self.data = OddCase{a:null,b:42,c:null};
    }
}