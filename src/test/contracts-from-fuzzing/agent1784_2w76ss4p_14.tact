struct Flat {
    a: Int;
    b: Bool;
    c: Int;
}

contract NestedFieldsFlat {
    x: Flat;
    y: Flat;

    init() {
        self.x = Flat{a:1,b:true,c:3};
        self.y = Flat{a:4,b:false,c:6};
    }
}