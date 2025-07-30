struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    nest: Level3;
    flag: Bool;
}

struct Level1 {
    value: Int;
    maybeInner: Level2?;
    text: String;
}

contract DeepNested {
    data: Level1;
    
    init() {
        self.data = Level1{
            value: 1,
            maybeInner: null,
            text: "hi"
        };
    }
}
