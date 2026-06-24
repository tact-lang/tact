// nesting several structs levels deep with multiple primitive types
struct Level1 { a:Int; b:Bool; c:String; }
struct Level2 { l1:Level1; addr:Address; val:Int; }
struct Level3 { l2:Level2; flag:Bool; text:String; }

contract DeepHier {
    data: Level3;
    init() {
        self.data = Level3{
            l2: Level2{
                l1: Level1{a:1,b:true,c:"str"},
                addr: myAddress(),
                val: 9
            },
            flag: false,
            text: "deep"
        };
    }
}