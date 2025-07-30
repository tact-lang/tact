struct OptionalBottom {
    n: Int?;
}

struct Middle {
    o1: OptionalBottom;
    o2: OptionalBottom;
}

struct Top {
    mid1: Middle;
    mid2: Middle;
}

contract DeepNulls {
    data: Top;

    init() {
        self.data = Top{
            mid1: Middle{ o1: OptionalBottom{ n: null }, o2: OptionalBottom{ n: null } },
            mid2: Middle{ o1: OptionalBottom{ n: null }, o2: OptionalBottom{ n: null } }
        };
    }
}