struct Level3 {
    value: Int;
}

struct Level2 {
    nestedL3: Level3;
    flag: Bool;
}

struct Level1 {
    nestedL2: Level2;
    str: String;
}

contract MultiLevel {
    payload: Level1;

    init() {
        self.payload = Level1{
            nestedL2: Level2{
                nestedL3: Level3{
                    value: 123,
                },
                flag: false,
            },
            str: "hello",
        };
    }
}