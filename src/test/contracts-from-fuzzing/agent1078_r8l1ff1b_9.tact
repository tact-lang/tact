struct Level3 { x:Int; y:Int; }
struct Level2 { third: Level3; note:String; }
struct Level1 { second: Level2; ok:Bool; number:Int; }

contract MixDeepWide {
    data: Level1;

    init() {
        self.data = Level1{ second: Level2{ third: Level3{ x:1, y:2 }, note:"hi" }, ok:true, number:123 };
    }
}