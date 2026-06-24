struct DeepNestOptionals {
    a: Int?;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract DeepOpt {
    data: DeepNestOptionals;

    init() {
        self.data = DeepNestOptionals{
            a: null,
            b: Inner{ x:99, y:null }
        };
    }
}