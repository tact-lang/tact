struct Inner {
    a: Int;
    b: Int;
}

contract ManyStructFields {
    f1: Inner;
    f2: Inner;
    f3: Inner;
    f4: Inner;
    f5: Inner;

    init() {
        self.f1 = Inner{a:1,b:2};
        self.f2 = Inner{a:3,b:4};
        self.f3 = Inner{a:5,b:6};
        self.f4 = Inner{a:7,b:8};
        self.f5 = Inner{a:9,b:10};
    }
}