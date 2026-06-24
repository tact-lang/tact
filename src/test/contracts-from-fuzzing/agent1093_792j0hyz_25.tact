struct Mid {
    middle: Inner; 
}

struct Inner {
    deep: Deeper;
}

struct Deeper {
    val1: Int;
    val2: Int;
    val3: Int;
}

contract TestDeepNest {
    n: Mid;

    init() {
        self.n = Mid{
            middle: Inner{
                deep: Deeper{ val1: 1, val2: 2, val3: 3 }
            }
        };
    }
}