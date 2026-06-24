struct Layer1 {
    x: Int;
    y: Bool;
}
struct Layer2 {
    a: Layer1;
    s: String;
}
contract NestedLayers {
    data: Layer2;
    init() {
        self.data = Layer2{
            a: Layer1{ x:1, y:true },
            s: "layer2",
        };
    }
}