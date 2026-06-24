struct DoubleLayer {
    a: Int;
    b: Bool;
}

struct Top {
    b: Bool;
    layer: DoubleLayer;
    c: String;
}

contract NestedMiddle {
    data: Top;
    init() {
        self.data = Top{ b:true, layer:DoubleLayer{a:5,b:false}, c:"t" };
    }
}