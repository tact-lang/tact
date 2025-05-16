struct SDeep {
    a: Int?;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
}

struct SWrap {
    s1: SDeep?;
    s2: SDeep?;
    num: Int;
    flag: Bool;
    text: String;
}

contract TestContract {
    top: SWrap;

    init() {
        self.top = SWrap{
            s1: null,
            s2: SDeep{a:1,b:true,c:"x",d:null,e:null,f:"y",g:5},
            num: 42,
            flag: false,
            text: "hello"
        };
    }
}