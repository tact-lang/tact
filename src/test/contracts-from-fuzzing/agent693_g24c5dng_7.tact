struct Child {
    a: Int;
}

struct Parent {
    x: Int;
    maybeChild: Child?;
    y: Bool;
}

contract OptMiddle {
    data: Parent;

    init() {
        self.data = Parent{ x:1, maybeChild:null, y:true };
    }
}