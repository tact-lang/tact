struct LevelA { val: Int }
struct LevelB { a: LevelA }
struct LevelC { b: LevelB }
struct LevelD { c: LevelC }
struct LevelE { d: LevelD }
struct LevelF { e: LevelE }

contract DeepDeep {
    f: LevelF;
    init() {
        self.f = LevelF{ e: LevelE{ d: LevelD{ c: LevelC{ b: LevelB{ a: LevelA{ val: 42 } } } } } };
    }
}