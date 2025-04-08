struct X {
    a: Int;
}

struct Y {
    b: X;
    c: Int;
}

struct Z {
    d: Y;
    e: Bool;
}

contract Cross {
    data: Z;
    init(){
        self.data = Z{
            d: Y{
                b: X{a:10},
                c:20
            },
            e:true
        };
    }
}