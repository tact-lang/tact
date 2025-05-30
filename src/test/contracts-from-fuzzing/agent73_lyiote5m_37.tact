struct ReorderTest {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test {
    val: ReorderTest;

    init() {
        self.val = ReorderTest{
            a:1,b:true,c:"hi",d:null,e:null,f:null
        };
    }
}