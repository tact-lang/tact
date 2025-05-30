struct ComposePrimitive {
    x: Int;
    y: Bool;
}

contract ComposeStructTwice {
    a: ComposePrimitive;
    b: ComposePrimitive;

    init() {
        self.a = ComposePrimitive{x:10,y:true};
        self.b = ComposePrimitive{x:20,y:false};
    }
}
