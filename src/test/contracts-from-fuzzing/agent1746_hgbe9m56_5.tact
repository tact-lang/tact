struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    nested3: Level3;
    txt: String;
}

struct Level1 {
    nested2: Level2;
    optional: Level2?;
    number: Int;
}

contract TestContract {
    field: Level1;

    init() {
        self.field = Level1{
            nested2: Level2{nested3: Level3{a: 5, b: true}, txt: "x"},
            optional: null,
            number: 9
        };
    }
}
