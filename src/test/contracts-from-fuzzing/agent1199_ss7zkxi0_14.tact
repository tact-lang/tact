struct DeepInner {
    a: Bool?;
    b: Bool;
}

struct Middle {
    aa: Bool?;
    bb: Bool;
    nested: DeepInner?;
}

contract TestContract {
    data: Middle;

    init() {
        self.data = Middle{
            aa: null,
            bb: true,
            nested: DeepInner{
                a: null,
                b: false
            }
        };
    }
}