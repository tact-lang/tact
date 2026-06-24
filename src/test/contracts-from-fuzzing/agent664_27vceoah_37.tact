struct Outermost {
    f: Int;
    g: String;
    h: Bool;
}

struct MiddleLayer {
    a: String?;
    b: Outermost;
}

contract JoinedStructs {
    val: MiddleLayer;

    init() {
        self.val = MiddleLayer { a:null, b: Outermost{f:1,g:"x",h:true} };
    }
}
