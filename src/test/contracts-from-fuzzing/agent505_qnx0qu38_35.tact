struct DeepOpt {
    x: Int?;
    y: Bool?;
}

contract DeepOpts {
    a: DeepOpt = DeepOpt{ x:null, y:null };
    b: DeepOpt = DeepOpt{ x:null, y:true };

    init() {
        self.a = DeepOpt{ x:5, y:false };
        self.b = self.b;
    }

    receive() {
        self.a = self.a;
    }
}