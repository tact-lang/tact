struct Level3 { a:Int; b:Bool; }
struct Level2 { inner:Level3; s:String; }
struct Level1 { nested:Level2; flag:Bool?; }

contract Test {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                inner: Level3{a:7,b:true}, s: "hi"},
            flag: null
        };
    }
}