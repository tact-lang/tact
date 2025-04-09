struct Arr {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyStructs {
    s1: Arr;
    s2: Arr;
    s3: Arr;

    init() {
        self.s1 = Arr{a:1,b:true,c:"x"};
        self.s2 = Arr{a:2,b:false,c:"y"};
        self.s3 = Arr{a:3,b:true,c:"z"};
    }
}