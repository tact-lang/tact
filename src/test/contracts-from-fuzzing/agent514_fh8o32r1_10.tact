struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract NestedOptionsTest {
    opt: NestedOpt?;
    init() {
        self.opt = NestedOpt{
            a:1,b:true,c:myAddress()
        };
    }
}