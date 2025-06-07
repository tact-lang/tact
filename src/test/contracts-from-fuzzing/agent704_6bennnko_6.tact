struct Level2 {
    number: Int;
    flag: Bool?;
    text: String;
}

struct Level1 {
    l2: Level2?;
}

contract OptionalDeepNested {
    data: Level1?;

    init() {
        self.data = Level1{
            l2: Level2{number: 5, flag: null, text: "hello"}
        };
    }
}