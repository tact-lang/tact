struct Rec1 {
    a: Int;
    b: String;
}

struct Rec2 {
    r: Rec1;
    c: Bool;
}

struct Rec3 {
    s: Rec2;
    d: Int?;
}

contract MultiNest {
    value: Rec3;

    init() {
        self.value = Rec3{ s: Rec2{ r: Rec1{a:1,b:"s"}, c:true }, d:null };
    }
}