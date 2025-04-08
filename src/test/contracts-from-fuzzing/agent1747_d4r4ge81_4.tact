struct InnerMost {
    flag: Bool?; 
}

struct Middle {
    midVal: Int = 5;
    im: InnerMost;
}

struct OuterMost {
    outerVal: Int = 42;
    middle: Middle;
}

contract DeepNestedOptionals {
    store: OuterMost = OuterMost{
        outerVal: 99,
        middle: Middle{
            midVal: 88,
            im: InnerMost{ flag: null }
        }
    };

    init() {}
}