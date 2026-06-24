struct InnerBool {
    b: Bool;
}
struct Container {
    inner: InnerBool;
}
contract BoolNested {
    x: Container;
    init() {
        self.x = Container{inner: InnerBool{b:true}};
    }
}