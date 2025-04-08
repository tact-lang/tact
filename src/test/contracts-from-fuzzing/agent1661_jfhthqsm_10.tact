struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract WideStore {
    w: Wide = Wide{
        a:1, b:true, c:"a", d:2, e:false, f:"b", g:3, h:true, i:"c", j:4
    };

    init() {
        self.w = Wide{
            a:9, b:false, c:"z", d:8, e:true, f:"y", g:7, h:false, i:"x", j:6
        };
    }
}