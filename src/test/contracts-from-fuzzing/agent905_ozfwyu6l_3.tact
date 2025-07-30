struct Level2 {
    a: Int = 5;
    b: String = "deep";
}

struct Level1 {
    l2: Level2;
    flag: Bool = false;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{},
            flag: true
        };
    }
}