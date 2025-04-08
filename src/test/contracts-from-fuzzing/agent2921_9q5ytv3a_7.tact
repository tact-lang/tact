struct Small {
    f: Int?;
}

struct Medium {
    s1: Small?;
    s2: Small?;
}

struct Large {
    m: Medium?;
}

contract NullableLayers {
    field: Large;
    
    init() {
        self.field = Large{
            m: Medium{
                s1: Small{f: 1},
                s2: null
            }
        };
    }
}