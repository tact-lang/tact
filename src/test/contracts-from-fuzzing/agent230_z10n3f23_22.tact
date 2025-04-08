struct ManyStructs {
    a: Int;
    b: Int;
    c: Int;
}

contract MultiInstance {
    x: ManyStructs;
    y: ManyStructs;

    init() {
        self.x = ManyStructs{a:1,b:2,c:3};
        self.y = ManyStructs{a:4,b:5,c:6};
    }
}
