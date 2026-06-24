struct Level3 {
    foo: Int;
    bar: Bool;
}

struct Level2 {
    nestedOpt: Level3?;
    fixedVal: Int;
}

struct Level1 {
    opt2: Level2?;
}

contract DoubleOptionalStruct {
    val: Level1;

    init() {
        self.val = Level1{
            opt2: Level2{
                nestedOpt: null,
                fixedVal: 55,
            },
        };
    }
}
