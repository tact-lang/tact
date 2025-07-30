struct BiggerNested {
    level1: Level1;
}

struct Level1 {
    level2a: Level2;
    level2b: Level2;
    level2c: Level2;
}

struct Level2 {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
}

contract TestContract {
    storage: BiggerNested;

    init() {
        self.storage = BiggerNested{
            level1: Level1{
                level2a: Level2{
                    intVal: 1,
                    boolVal: false,
                    addrVal: myAddress(),
                    strVal: "a",
                },
                level2b: Level2{
                    intVal: 2,
                    boolVal: true,
                    addrVal: myAddress(),
                    strVal: "b",
                },
                level2c: Level2{
                    intVal: 3,
                    boolVal: false,
                    addrVal: myAddress(),
                    strVal: "c",
                },
            },
        };
    }
}