struct LayerX {
    a: Int;
    b: Bool;
}

struct LayerY {
    next: LayerX; 
    c: String;
}

contract DeepFieldOrder {
    data: LayerY;
    init() {
        self.data = LayerY{next: LayerX{a:3,b:true},c:"done"};
    }
}