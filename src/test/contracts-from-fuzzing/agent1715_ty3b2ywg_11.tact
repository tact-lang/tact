struct LevelOne { aa: Int; bb: Int }
struct LevelTwo { nested: LevelOne }
struct LevelThree { nested: LevelTwo }
struct LevelFour { nested: LevelThree }
contract TestContract {
    val: LevelFour = LevelFour{
        nested: LevelThree{
            nested: LevelTwo{
                nested: LevelOne{
                    aa: 1,
                    bb: 2
                }
            }
        }
    };
}