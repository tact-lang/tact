struct HasTuple {
    a: Int;
    b: Bool;
}

contract AdjacentStructs {
    x: HasTuple;
    y: HasTuple;

    init() {
        self.x = HasTuple{a:1,b:true};
        self.y = HasTuple{a:2,b:false};
    }
}