struct Tiny {
    f1: Int;
}

struct TinyWrapper {
    tw1: Tiny;
    tw2: Tiny;
    tw3: Tiny;
    tw4: Tiny;
    tw5: Tiny;
    tw6: Tiny;
    tw7: Tiny;
    tw8: Tiny;
    tw9: Tiny;
    tw10: Tiny;
}

contract ContractWithManyNestedTiny {
    wrap: TinyWrapper;

    init() {
        self.wrap = TinyWrapper{
            tw1: Tiny{f1:1}, tw2: Tiny{f1:2}, tw3: Tiny{f1:3},
            tw4: Tiny{f1:4}, tw5: Tiny{f1:5}, tw6: Tiny{f1:6},
            tw7: Tiny{f1:7}, tw8: Tiny{f1:8}, tw9: Tiny{f1:9},
            tw10: Tiny{f1:10}
        };
    }
}