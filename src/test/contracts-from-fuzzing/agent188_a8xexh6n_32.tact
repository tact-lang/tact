struct ABoolOpt {
    a: Bool?;
    b: Bool?;
}

contract ManyOptBool {
    v: ABoolOpt;

    init() {
        self.v = ABoolOpt { a:null, b:true };
    }
}