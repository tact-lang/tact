struct Layerone {
    layer: Layertwo;
}

struct Layertwo {
    layer: Layerthree;
}

struct Layerthree {
    flag: Bool;
    msg: String;
}

contract NestedLayers {
    data: Layerone;

    init() {
        self.data = Layerone{
            layer: Layertwo{
                layer: Layerthree{
                    flag: false,
                    msg: "nested layers"
                }
            }
        };
    }
}