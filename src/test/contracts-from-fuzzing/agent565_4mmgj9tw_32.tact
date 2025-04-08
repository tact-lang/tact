struct DefaultOpt {
    a: Int?;
    b: Int = 5;
}

contract DefaultOptComb {
    x: DefaultOpt;
    init() {
        self.x = DefaultOpt{ a:null, b:6 };
    }
}