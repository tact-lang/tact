struct DeepNested {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    a: Int;
    b: Bool?;
    s: InnerMost;
}

struct InnerMost {
    text: String;
    flag: Bool;
}

contract DeepNestedTest {
    field: DeepNested;
    init() {
        self.field = DeepNested{
            inner1: Inner{a:1, b:true, s:InnerMost{text:"x",flag:false}},
            inner2: Inner{a:2, b:null, s:InnerMost{text:"y",flag:true}}
        };
    }
}