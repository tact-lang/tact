struct DeepStr {
    a: Int;
    b: String;
    c: Bool;
    d: String;
    e: Bool;
    f: String;
    g: Bool;
    h: String;
}

contract DeepStringStruct {
    s: DeepStr;

    init() {
        self.s = DeepStr{
            a:1, b:"b", c:true, d:"d", e:false, f:"f", g:true, h:"h"
        };
    }
}