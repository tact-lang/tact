struct DeepNestLevel3 {
    z: Int;
    b: Bool;
}

struct DeepNestLevel2 {
    y: DeepNestLevel3;
    c: Bool;
}

struct DeepNestLevel1 {
    x: DeepNestLevel2;
    d: Bool;
}

contract TestContract {
    deep: DeepNestLevel1;
    
    init() {
        self.deep = DeepNestLevel1{
            x: DeepNestLevel2{
                y: DeepNestLevel3{
                    z: 42,
                    b: true
                },
                c: false
            },
            d: true
        };
    }
}