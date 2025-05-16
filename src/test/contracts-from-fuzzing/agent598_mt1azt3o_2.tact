struct LevelTwo { val: Int; }

struct LevelOne { nested: LevelTwo; }

contract OptNestedTest {
    optNested: LevelOne?;

    init() {
        self.optNested = LevelOne{ nested: LevelTwo{ val: 77 } };
    }
}