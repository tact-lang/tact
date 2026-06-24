struct Payload {
    a: Int;
    b: Bool;
}

contract StructArray {
    p1: Payload;
    p2: Payload;
    p3: Payload;

    init() {
        self.p1 = Payload{a:1,b:true};
        self.p2 = Payload{a:2,b:false};
        self.p3 = Payload{a:3,b:true};
    }
}