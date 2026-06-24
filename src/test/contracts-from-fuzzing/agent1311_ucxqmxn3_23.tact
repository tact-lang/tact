struct DeepNullMix {
    n: Nested?;
}

struct Nested {
    x: Int;
    y: Bool?;
}

contract TestContract {
    data: DeepNullMix;

    init() {
        self.data = DeepNullMix{
            n: Nested{x:0,y:null}
        };
    }
}
