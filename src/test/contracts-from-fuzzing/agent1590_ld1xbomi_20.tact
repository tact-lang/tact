struct DeepInner {
    value: Int;
}
struct Middle {
    content: DeepInner;
}
struct OuterLayer {
    m: Middle;
}

contract NestedTriple {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            m: Middle{
                content: DeepInner{value: 3}
            }
        };
    }
}