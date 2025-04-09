struct LevelOne { val: Int; }
struct LevelTwo { inner: LevelOne; }
struct LevelThree { inner: LevelTwo; }
struct LevelFour { inner: LevelThree; }
struct LevelFive { inner: LevelFour; }

contract MoreNested {
    deepField: LevelFive;
    init() {
        self.deepField = LevelFive{ inner: LevelFour{
          inner: LevelThree{ inner: LevelTwo{ inner: LevelOne{ val: 42 } } } } };
    }
}