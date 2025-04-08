struct Level2 {
    a: Int;
    b: Bool?;
}

struct Level1 {
    inner: Level2;
    other: Level2?;
}

contract StructsWithOptionals {
    top: Level1;

    init() {
        self.top = Level1{
            inner: Level2{a:1,b:true},
            other: null,
        };
    }
}