struct Levels3 {
    a: Int;
    b: Bool;
}

struct Levels2 {
    a: Levels3;
    b: Int;
}

struct Levels1 {
    a: Levels2;
    b: Bool;
}

contract DeepThreeLevels {
    storage: Levels1;

    init() {
        self.storage = Levels1{
            a: Levels2{
                a: Levels3{ a: 1, b: true },
                b: 2
            },
            b: false
        };
    }
}