struct Str1 {
    a: Int;
}

struct Str2 {
    b: Int;
    c: Str1;
}

struct Str3 {
    d: Str2;
    e: Int?;
}

struct Str4 {
    x: Str3;
    y: Bool;
}

contract ManyNest {
    field: Str4;

    init() {
        self.field = Str4{
            x: Str3{
                d: Str2{
                    b:1,c:Str1{a:2}
                },
                e:null
            },
            y:true
        };
    }
}