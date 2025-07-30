struct NestedDeep {
    d1: Int;
    d2: Int?;
}

struct MidLevel {
    m1: Int;
    m2: NestedDeep;
    m3: Bool?;
}

contract TestContract {
    data: MidLevel; 
    
    init() {
        self.data = MidLevel{
            m1: 1,
            m2: NestedDeep{
                d1: 10,
                d2: null,
            },
            m3: true,
        };
    }
}