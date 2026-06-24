struct InnerX { x: Int?; y: Bool; }

struct OuterX {
    foo: Int;
    inner: InnerX?;
}

contract OptionalNestedStructContract {
    v: OuterX;
    init() {
        self.v = OuterX{ foo: 1, inner: InnerX{x:null,y:false} };
    }
}