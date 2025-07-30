struct Outer {
    x: Int;
    y: Bool;
}

contract StructDefaultInit {
    field: Outer = Outer{ x:1, y:true };

    init() {
        self.field = Outer{ x:2, y:false };
    }
}