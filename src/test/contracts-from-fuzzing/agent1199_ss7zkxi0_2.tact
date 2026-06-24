struct DeepInner {
    x: Int?;
    y: Bool?;
}

struct Middle {
    node: DeepInner;
}

contract TestContract {
    info: Middle;

    init() {
        self.info = Middle{
            node: DeepInner{
                x: null,
                y: null,
            }
        };
    }
}