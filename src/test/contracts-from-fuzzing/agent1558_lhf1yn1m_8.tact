struct Inner1 {
    f1: Int;
    f2: Bool;
}

struct Inner2 {
    f3: Int?;
    f4: Bool?;
}

struct Combo {
    left: Inner1;
    right: Inner2;
    number: Int;
    flag: Bool;
}

contract TestContract {
    c: Combo;

    init() {
        self.c = Combo{
            left: Inner1{f1:1,f2:true},
            right: Inner2{f3:null, f4:null},
            number: 777,
            flag: false,
        };
    }
}
