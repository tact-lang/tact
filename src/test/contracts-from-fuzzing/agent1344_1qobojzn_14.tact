struct Layer {
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool;
    msg: String;
}

contract StructNullInit {
    layer: Layer;

    init() {
        self.layer = Layer{ innerOpt: null };
    }
}
