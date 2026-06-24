struct Arr {
    a: Int;
    b: Int;
}

struct ManyNested {
    a1: Arr;
    a2: Arr;
    a3: Arr;
    a4: Arr;
    a5: Arr;
    a6: Arr;
    a7: Arr;
    a8: Arr;
    a9: Arr;
    a10: Arr;
}

contract NestedWide {
    data: ManyNested;

    init() {
        self.data = ManyNested{
            a1: Arr{a:1,b:2},
            a2: Arr{a:3,b:4},
            a3: Arr{a:5,b:6},
            a4: Arr{a:7,b:8},
            a5: Arr{a:9,b:10},
            a6: Arr{a:11,b:12},
            a7: Arr{a:13,b:14},
            a8: Arr{a:15,b:16},
            a9: Arr{a:17,b:18},
            a10: Arr{a:19,b:20}
        };
    }
}