struct ComposeManyLayers1 {
    x: Int;
}
struct ComposeManyLayers2 {
    c: ComposeManyLayers1;
}
struct ComposeManyLayers3 {
    c: ComposeManyLayers2;
}

contract ComposeManyLayersContract {
    state: ComposeManyLayers3;

    init() {
        self.state = ComposeManyLayers3{c:ComposeManyLayers2{c:ComposeManyLayers1{x:5}}};
    }
}
