struct LevelOne { x:Int }
struct LevelTwo { one: LevelOne }
struct LevelThree { two: LevelTwo }

contract MultiLayer {
    layer: LevelThree;

    init() {
        self.layer = LevelThree{
            two: LevelTwo{
                one: LevelOne{ x:123 }
            }
        };
    }
}