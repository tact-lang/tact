struct ReorderTest {
    a:Int;
    b:Bool;
    c:String;
    d:Int?;
    e:String?;
    f:Bool?;
}

contract ReorderTestContract {
    s:ReorderTest;

    init() {
        self.s = ReorderTest{
            a:1,b:true,c:"x",d:null,e:"ok",f:false
        };
    }
}