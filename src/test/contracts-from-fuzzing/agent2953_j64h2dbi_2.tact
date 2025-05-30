struct Level2 {
    x: Int;
    y: Bool?;
    z: String;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract NestedDeepContract {
    state: Level1;

    init() {
        self.state = Level1{
            nested: Level2{
                x: 42,
                y: null,
                z: "deep",
            },
            flag: true,
        };
    }
}