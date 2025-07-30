struct Level3 {
    i: Int;
    b: Bool?;
    s: String;
}

struct Level2 {
    inner: Level3;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    optAddr: Address?;
}

contract NestedMixed {
    data: Level1;
    
    init() {
        self.data = Level1{
            l2: Level2{
                inner: Level3{i:5,b:null,s: "hi"},
                flag:true
            },
            optAddr:null
        };
    }
}