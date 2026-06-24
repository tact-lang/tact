struct Nested {
    sub1: Sub1;
    sub2: Sub2;
}

struct Sub1 {
    f1: Int;
    f2: Bool;
}

struct Sub2 {
    f3: String;
    f4: Int?;
}

contract Test {
    n: Nested;

    init() {
        self.n = Nested{
            sub1: Sub1{f1:10,f2:true},
            sub2: Sub2{f3:"test",f4:null}
        };
    }
}
