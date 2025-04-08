struct Tiny {
    a: Int as uint1;
    b: Bool;
}

contract SerializedNest {
    field: Tiny;

    init() {
        self.field = Tiny{a:1,b:true};
    }
}