// cross nested messages and structs
struct FooS {
    x: Int;
    y: Bool?;
}

message(101) BarM {
    data: FooS;
    optInt: Int?;
}

contract CrossPersist {
    m: BarM;

    init() {
        self.m = BarM{
            data: FooS{ x:1, y:true },
            optInt: null
        };
    }
}