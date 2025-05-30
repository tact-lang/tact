struct SOptBool {
    x: Bool?;
}

contract ReuseOptBool {
    a: SOptBool;
    b: SOptBool;

    init() {
        self.a = SOptBool{x:true};
        self.b = SOptBool{x:null};
    }
}
