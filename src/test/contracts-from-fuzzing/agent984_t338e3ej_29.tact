struct SuperDeep {
    d1: Int;
    d2: Int;
    d3: Int;
}

struct Layer3 {
    s: SuperDeep;
    t: SuperDeep;
}

struct Layer2 {
    l: Layer3;
    m: Layer3;
}

struct Layer1 {
    p: Layer2;
    q: Layer2;
}

contract UltraNest {
    u: Layer1;

    init() {
        self.u = Layer1{
            p: Layer2{
                l: Layer3{s: SuperDeep{d1:1,d2:2,d3:3}, t: SuperDeep{d1:4,d2:5,d3:6}},
                m: Layer3{s: SuperDeep{d1:7,d2:8,d3:9}, t: SuperDeep{d1:10,d2:11,d3:12}}
            },
            q: Layer2{
                l: Layer3{s: SuperDeep{d1:13,d2:14,d3:15}, t: SuperDeep{d1:16,d2:17,d3:18}},
                m: Layer3{s: SuperDeep{d1:19,d2:20,d3:21}, t: SuperDeep{d1:22,d2:23,d3:24}}
            }
        };
    }
}