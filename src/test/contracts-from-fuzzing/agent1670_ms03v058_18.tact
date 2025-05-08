struct LevelOne { a: Int; }
struct LevelTwo { x: LevelOne; }
struct LevelThree { y: LevelTwo; }
struct LevelFour { z: LevelThree; }
struct LevelFive { q: LevelFour; }

contract TestFiveDeep {
    d: LevelFive;
    init() {
        self.d = LevelFive{
            q: LevelFour{
                z: LevelThree{
                    y: LevelTwo{
                        x: LevelOne{a:1}
                    }
                }
            }
        };
    }
}
