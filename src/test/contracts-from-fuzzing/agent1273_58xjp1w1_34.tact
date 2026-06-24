struct BigNested {
    a: Int;
    b: Bool;
    c: String;
}

struct Holder {
    n1: BigNested;
    n2: BigNested;
    n3: BigNested;
}

contract ManyNestStructs {
    h: Holder;

    init() {
        self.h = Holder{
            n1: BigNested{a:1,b:true,c:"X"},
            n2: BigNested{a:2,b:false,c:"Y"},
            n3: BigNested{a:3,b:true,c:"Z"}
        };
    }
}