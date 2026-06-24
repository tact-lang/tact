struct StringLayer {
    s1: String;
    s2: String;
}

struct IntLayer {
    i1: Int;
    i2: Int;
}

struct Wrapper {
    strings: StringLayer;
    ints: IntLayer;
}

contract NestedMixed {
    data: Wrapper;

    init() {
        self.data = Wrapper{ 
            strings: StringLayer{ s1:"a", s2:"b" },
            ints: IntLayer{ i1:1, i2:2 } 
        };
    }
}