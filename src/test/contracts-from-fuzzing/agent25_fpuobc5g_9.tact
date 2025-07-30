struct DeepOpt {
    inner: Middle?;
}
struct Middle {
    nested: Leaf?;
}
struct Leaf {
    x: Int;
    y: String;
}
contract Test {
    d: DeepOpt;
    init() {
        self.d = DeepOpt{
            inner: Middle{
                nested: Leaf{ x:10, y:"leaf" }
            }
        };
    }
}