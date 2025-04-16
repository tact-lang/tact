struct ManyLevelsA { a: Int }
struct ManyLevelsB { b: ManyLevelsA }
struct ManyLevelsC { c: ManyLevelsB }
struct ManyLevelsD { d: ManyLevelsC }
struct ManyLevelsE { e: ManyLevelsD }

contract ManyLevelStruct {
    data: ManyLevelsE;
    init() {
        self.data = ManyLevelsE{ e: ManyLevelsD{ d: ManyLevelsC{ c: ManyLevelsB{ b: ManyLevelsA{ a: 7 } } } } };
    }
}