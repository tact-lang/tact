struct LevelOne {
    a: Int;
    b: Bool;
}
struct LevelTwo {
    inner: LevelOne;
    opt: Int?;
}

contract SerialNested {
    data: LevelTwo;

    init() {
        self.data = LevelTwo{
            inner: LevelOne{a:15,b:true},
            opt: null
        };
    }
}