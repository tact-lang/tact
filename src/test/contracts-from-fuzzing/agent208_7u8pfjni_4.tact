struct Deep {
    innermost: Int;
}

struct Mid {
    deep1: Deep;
    deep2: Deep;
}

struct Outer {
    mid: Mid;
    flag: Bool;
}

contract Test5 {
    complex: Outer;
    
    init() {
        self.complex = Outer{
            mid: Mid{
                deep1: Deep{ innermost: 1 },
                deep2: Deep{ innermost: 2 },
            },
            flag: true,
        };
    }
}