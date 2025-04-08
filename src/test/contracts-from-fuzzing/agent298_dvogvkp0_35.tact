struct Arr {
    a: Int;
    b: Int;
    c: Int;
}
contract ManyStructs {
    s1: Arr;
    s2: Arr;
    s3: Arr;
    init() {
        self.s1 = Arr{a:1,b:2,c:3};
        self.s2 = Arr{a:4,b:5,c:6};
        self.s3 = Arr{a:7,b:8,c:9};
    }
}