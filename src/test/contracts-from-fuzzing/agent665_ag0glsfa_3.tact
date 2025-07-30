struct DeepNested {
    a: Int;
    b: Bool;
    c: String;
}

struct MiddleLayer {
    nested: DeepNested;
    val: Int;
}

contract DeepContract {
    layer: MiddleLayer = MiddleLayer{
        nested: DeepNested{a:1, b:true, c:"start"}, val: 10
    };

    init() {
        self.layer = MiddleLayer{
            nested: DeepNested{a:42, b:false, c:"middle"}, val: 99
        };
    }

    receive() {
        let _ = self.layer;
    }
}