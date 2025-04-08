struct Sub1 {
    a: Int;
    b: Bool;
}

struct Sub2 {
    c: String;
    d: Int?;
}

struct Combo {
    sub1: Sub1;
    sub2: Sub2;
    flag: Bool;
    amount: Int?;
    text: String;
}

contract Test {
    complex: Combo;

    init() {
        self.complex = Combo{
            sub1: Sub1{a:1,b:true},
            sub2: Sub2{c:"",d:null},
            flag: false,
            amount: null,
            text: "abc"
        };
    }
}
