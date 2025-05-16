struct Level2 {
    z: String;
    flag: Bool;
}

struct Level1 {
    innerOpt: Level2?;
    count: Int;
}

contract NestedOptionalStruct {
    state: Level1;

    init() {
        self.state = Level1{
            innerOpt: Level2{z: "deep", flag: true},
            count: 5
        };
    }
}