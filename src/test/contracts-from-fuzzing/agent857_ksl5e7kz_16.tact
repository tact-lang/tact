struct LevelThree {
    flag: Bool;
    note: String;
}

struct LevelTwo {
    inner: LevelThree;
    count: Int;
}

struct LevelOne {
    nested: LevelTwo;
    num: Int;
}

contract TestContract {
    stuff: LevelOne = LevelOne{
        nested: LevelTwo{
            inner: LevelThree{ flag:true, note:"" },
            count:5
        },
        num:1
    };
}