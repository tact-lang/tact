struct Ordered {
    x: Int?;
    y: Bool?;
    a: Int;
    b: Bool;
}

contract TestContract {
    f: Ordered = Ordered{x:null, y:null, a:0, b:false};

    init() {
        self.f = Ordered{x:null, y:null, a:1, b:true};
    }

    receive() {
        let _ = self.f;
    }
}