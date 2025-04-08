struct Level3 {
    foo: Int?;
    bar: Bool;
}

struct Level2 {
    alpha: Int;
    beta: Level3;
    gamma: Level3?;
}

struct Level1 {
    m: Level2;
    n: Level2?;
}

contract TestContract {
    complex: Level1;

    init() {
        self.complex = Level1{
            m: Level2{
                alpha: 1,
                beta: Level3{foo:null, bar:true},
                gamma: null
            },
            n: null
        };
    }
}