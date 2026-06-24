struct DeepNested {
    a: Int;
    b: Bool;
}

struct Level2 {
    nest: DeepNested;
    flag: Bool;
}

struct Level1 {
    data: Level2;
    opt: Bool?;
}

contract DeepContract {
    state: Level1;

    init() {
        self.state = Level1{
            data: Level2{
                nest: DeepNested{
                    a: 5,
                    b: true
                },
                flag: false
            },
            opt: true
        };
    }
}
