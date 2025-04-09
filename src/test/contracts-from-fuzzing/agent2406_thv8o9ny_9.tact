struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ManyDeepOptionals {
    x: DeeplyOptional;
    y: DeeplyOptional?;

    init() {
        self.x = DeeplyOptional{ a:null, b:true, c:null };
        self.y = null;
    }
}