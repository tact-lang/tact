struct STR {
    content: String;
    num: Int;
    flag: Bool;
}

contract StructInitOrder {
    x: Int;
    y: STR;
    z: Bool;

    init() {
        self.y = STR{content:"hi",num:5,flag:true};
        self.x = 42;
        self.z = false;
    }
}
