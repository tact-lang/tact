struct Nested1 {
    opt: Nested2?;
}

struct Nested2 {
    inner: DeepInner?;
}

struct DeepInner {
    flag: Bool;
    text: String;
}

contract MultipleMaybe {
    deepOpt: Nested1;
    
    init() {
        self.deepOpt = Nested1{
            opt: Nested2{
                inner: DeepInner{
                    flag: false,
                    text: "deep"
                }
            }
        };
    }
}