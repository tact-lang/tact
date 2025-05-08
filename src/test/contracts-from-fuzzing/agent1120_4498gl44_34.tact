struct OptionsLayer {
    a: Int?;
    layer: Inner?;
}

struct Inner {
    val: Bool;
}

contract OptLayerTest {
    layer: OptionsLayer;
    init() {
        self.layer = OptionsLayer{
            a:null,
            layer: Inner{val:true}
        };
    }
}