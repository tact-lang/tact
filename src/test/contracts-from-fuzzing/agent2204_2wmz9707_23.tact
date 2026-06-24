struct Tagged {
    id: Int;
    title: String;
    isActive: Bool;
}

contract ManyFields {
    t1: Tagged;
    t2: Tagged;
    t3: Tagged;
    t4: Tagged;
    init() {
        self.t1 = Tagged{ id:1, title:"A", isActive:true };
        self.t2 = Tagged{ id:2, title:"B", isActive:false };
        self.t3 = Tagged{ id:3, title:"C", isActive:true };
        self.t4 = Tagged{ id:4, title:"D", isActive:false };
    }
}