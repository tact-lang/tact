struct Payload { str:String; optStr:String? }

contract Large {
    a: Payload;
    b: Payload;
    c: Payload?;

    init() {
        self.a = Payload{str:"a",optStr:"aopt"};
        self.b = Payload{str:"b",optStr:null};
        self.c = null;
    }
}
