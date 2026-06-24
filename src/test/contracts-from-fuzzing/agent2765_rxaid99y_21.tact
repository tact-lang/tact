struct SA {
    s: String?;
    b: Bool;
}

contract ReassignOpt {
    a: SA;

    init() {
        self.a = SA{s:null,b:true};
        self.a = SA{s:"Hey",b:false};
    }
}