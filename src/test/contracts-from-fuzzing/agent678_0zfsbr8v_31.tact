// This contract mixes struct optionals, primitive optionals, and plenty of fields.
struct Meta {
    id: Int;
    flag: Bool?;
    label: String?;
}

contract MegaMix {
    a: Meta;
    b: Meta?;
    x: Int;
    y: Bool;
    z: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;

    init() {
        self.a = Meta{id:1,flag:null,label:null};
        self.b = null;
        self.x = 0;
        self.y = true;
        self.z = "zero";
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
    }
}