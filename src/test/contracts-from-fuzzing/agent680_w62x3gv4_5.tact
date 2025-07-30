struct DeepInner {
    a: Int;
    b: String;
    c: Bool?;
}

struct MidLevel {
    p: DeepInner;
    q: DeepInner;
    r: String;
}

struct Outer {
    ml: MidLevel;
    text: String;
    flag: Bool;
}

contract DeepNestedTest {
    storeAll: Outer = Outer{
        ml: MidLevel{
            p: DeepInner{a:1,b:"hi",c:null},
            q: DeepInner{a:2,b:"bye",c:true},
            r: "mid"
        },
        text: "outer",
        flag: true
    };

    init() {
        self.storeAll = self.storeAll;
    }

    receive() {
        let _ = self.storeAll.ml.p.a + 1;
    }
}