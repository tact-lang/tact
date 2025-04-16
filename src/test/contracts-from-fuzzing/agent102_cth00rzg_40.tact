struct Wide {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
}

struct Deep {
    w1: Wide;
    w2: Wide;
    w3: Wide;
}

contract WideDeep {
    s: Deep;

    init() {
        self.s = Deep{
            w1: Wide{a:1,b:2,c:3,d:4,e:5,f:6,g:7},
            w2: Wide{a:10,b:20,c:30,d:40,e:50,f:60,g:70},
            w3: Wide{a:100,b:200,c:300,d:400,e:500,f:600,g:700}
        };
    }
}