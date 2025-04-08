struct DeeplyNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

struct Container {
    inner: DeeplyNested;
    flag: Bool;
    comment: String;
    num: Int;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            inner: DeeplyNested{
                a:1,b:true,c:"c",d:null,e:false,f:"f",
                g:7,h:false,i:"i",j:10,k:true,l:null
            },
            flag:true, comment:"ok", num:42
        };
    }
}