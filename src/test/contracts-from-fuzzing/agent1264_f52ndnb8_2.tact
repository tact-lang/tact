struct Level3 {
    a: Int; 
    b: Bool; 
}

struct Level2 {
    nested: Level3;
    c: String;
}

struct Level1 {
    inner: Level2;
    d: Bool;
}

contract NestedStructs {
    data: Level1;
    init() {
        self.data = Level1{
            inner: Level2{
                nested: Level3{a: 1, b: false},
                c: "hi"
            },
            d: true
        };
    }
}