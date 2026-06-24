struct Wide {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

struct Wrap {
    s1: Wide;
    s2: Wide;
    s3: Wide;
    s4: Wide;
}

contract MultipleWideStructs {
    data: Wrap;

    init() {
        self.data = Wrap{
            s1: Wide{a:1,b:2,c:3,d:4,e:5,f:6},
            s2: Wide{a:7,b:8,c:9,d:10,e:11,f:12},
            s3: Wide{a:13,b:14,c:15,d:16,e:17,f:18},
            s4: Wide{a:19,b:20,c:21,d:22,e:23,f:24}
        };
    }
}