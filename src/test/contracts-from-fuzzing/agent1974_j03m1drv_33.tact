struct Tiny { x: Int; y: Bool; }

contract ManyTinys {
    t1: Tiny;
    t2: Tiny;
    t3: Tiny;
    t4: Tiny;
    t5: Tiny;
    t6: Tiny;
    t7: Tiny;
    t8: Tiny;
    t9: Tiny;
    t10: Tiny;

    init() {
        self.t1 = Tiny{ x:1, y:true };
        self.t2 = Tiny{ x:2, y:false };
        self.t3 = Tiny{ x:3, y:true };
        self.t4 = Tiny{ x:4, y:false };
        self.t5 = Tiny{ x:5, y:true };
        self.t6 = Tiny{ x:6, y:false };
        self.t7 = Tiny{ x:7, y:true };
        self.t8 = Tiny{ x:8, y:false };
        self.t9 = Tiny{ x:9, y:true };
        self.t10 = Tiny{ x:10, y:false };
    }
}
