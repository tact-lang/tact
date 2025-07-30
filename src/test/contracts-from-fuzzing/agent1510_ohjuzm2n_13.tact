struct Ordered {
    a: Int;
    b: Bool;
    x: Int?;
    y: Bool?;
}

contract TestContract {
    f: Ordered = Ordered{a:0, b:false, x:null, y:null};

    init() {
        self.f = Ordered{a:123, b:true, x:null, y:null};
    }

    receive() {
        let _ = self.f;
    }
}