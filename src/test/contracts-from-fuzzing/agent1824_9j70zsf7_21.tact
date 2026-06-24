// Mix optional, nested, and default fields
struct Deep {
    x: Int;
    y: String?;
}

struct Mid {
    deep: Deep;
    optionalDeep: Deep?;
}

contract ComplexMix {
    mid: Mid;

    init() {
        self.mid = Mid{
            deep: Deep{x:1,y:null},
            optionalDeep: null
        };
    }
}
