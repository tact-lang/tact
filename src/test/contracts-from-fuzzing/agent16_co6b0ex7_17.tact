struct NestedLayer1 { val: Int; }
struct NestedLayer2 { layer1: NestedLayer1; }
struct NestedLayer3 { layer2: NestedLayer2; }
struct NestedLayer4 { layer3: NestedLayer3; }
struct NestedLayer5 { layer4: NestedLayer4; }

contract FiveLayersDeep {
    fld: NestedLayer5;

    init() {
        self.fld = NestedLayer5{
            layer4: NestedLayer4{
                layer3: NestedLayer3{
                    layer2: NestedLayer2{
                        layer1: NestedLayer1{ val: 55 }
                    }
                }
            }
        };
    }
}