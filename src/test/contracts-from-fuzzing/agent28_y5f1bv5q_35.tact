struct Duo {
    first: Int;
    second: Int;
}

struct Many {
    d1: Duo;
    d2: Duo;
    d3: Duo;
    d4: Duo;
    d5: Duo;
    d6: Duo;
    d7: Duo;
    d8: Duo;
    d9: Duo;
    d10: Duo;
}

contract Test {
    all: Many;

    init() {
        self.all = Many{
            d1: Duo{first:1,second:2},
            d2: Duo{first:3,second:4},
            d3: Duo{first:5,second:6},
            d4: Duo{first:7,second:8},
            d5: Duo{first:9,second:10},
            d6: Duo{first:11,second:12},
            d7: Duo{first:13,second:14},
            d8: Duo{first:15,second:16},
            d9: Duo{first:17,second:18},
            d10: Duo{first:19,second:20}
        };
    }
}