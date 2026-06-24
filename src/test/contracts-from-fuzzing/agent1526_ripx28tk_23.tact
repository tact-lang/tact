struct Level1 {
    a:Int; b:Int?;
}
struct Level2 {
    c:Level1?; d:Bool;
}
struct Level3 {
    e:Level2; f:String?;
}

contract DeepMixedStruct {
    data: Level3;

    init() {
        self.data = Level3{
            e: Level2{
                c: Level1{
                    a:1, b:null
                },
                d:true
            },
            f: null
        };
    }
}