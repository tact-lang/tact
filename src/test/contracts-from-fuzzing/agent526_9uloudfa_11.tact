struct PackedBooleans {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract BooleansCompact {
    flags: PackedBooleans;

    init() {
        self.flags = PackedBooleans{
            a:true, b:false, c:true, d:false,
            e:true, f:false, g:true, h:false
        };
    }

    receive() {}
}