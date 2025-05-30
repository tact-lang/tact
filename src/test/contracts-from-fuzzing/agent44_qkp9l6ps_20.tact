struct Levels1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Levels2 {
    one: Levels1;
    two: Levels1;
}

struct Levels3 {
    pair: Levels2;
    also: Levels2;
}

contract MultiNested {
    storage: Levels3;

    init() {
        self.storage = Levels3{
            pair: Levels2{
                one: Levels1{a:1,b:true,c:"x"},
                two: Levels1{a:2,b:false,c:"y"}
            },
            also: Levels2{
                one: Levels1{a:3,b:true,c:"z"},
                two: Levels1{a:4,b:false,c:"w"}
            }
        };
    }
}