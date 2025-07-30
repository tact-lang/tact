struct FinalTest {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    val: Int;
    text: String?;
}

struct Inner2 {
    flag: Bool;
    optNum: Int?;
    optStr: String?;
}

contract MixNestedOpts {
    field: FinalTest;

    init() {
        self.field = FinalTest{
            inner1: Inner1{ val:5, text:null },
            inner2: Inner2{ flag:true, optNum:null, optStr:null }
        };
    }
}
