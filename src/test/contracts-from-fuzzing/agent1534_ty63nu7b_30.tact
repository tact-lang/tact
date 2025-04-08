struct OuterX { 
    a: Int;
    b: String; 
    c: InnerX;
}
struct InnerX {
    x: Int;
    y: Bool;
}

contract NestedStructsField {
    s: OuterX;
    init() {
        self.s = OuterX{
            a:1,
            b:"hi",
            c: InnerX { x:3, y:true }
        };
    }
}