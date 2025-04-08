struct DeepLevel3 {
    a: Int;
    b: Bool;
}

struct DeepLevel2 {
    nested: DeepLevel3;
    text: String;
}

struct DeepLevel1 {
    nested: DeepLevel2;
    flag: Bool;
}

contract TestContract {
    data: DeepLevel1;
    
    init() {
        self.data = DeepLevel1{
            nested: DeepLevel2{
                nested: DeepLevel3{
                    a: 7,
                    b: true
                },
                text: "deep"
            },
            flag: false
        };
    }
}
