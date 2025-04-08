struct Layer3 { x: Int; optstr: String?; }
struct Layer2 { layer3: Layer3; b: Bool; }
struct Layer1 { layer2: Layer2; str: String; }

contract NestedLayers {
    obj: Layer1;

    init() {
        self.obj = Layer1{
            layer2: Layer2{
                layer3: Layer3{ x:77, optstr: null },
                b: false
            },
            str: "hello"
        };
    }
}
