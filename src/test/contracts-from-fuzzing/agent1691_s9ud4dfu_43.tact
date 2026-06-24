struct OffsetTest {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
}

contract OffsetOrderContract {
    val: OffsetTest;

    init() {
        self.val = OffsetTest{
            a:1,b:true,c:2,d:false,e:3
        };
    }
}