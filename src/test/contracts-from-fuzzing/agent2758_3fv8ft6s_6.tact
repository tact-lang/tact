struct Level1 {
    a: Bool;
    b: Level2;
}

struct Level2 {
    x: Int;
    y: Bool;
    z: Level3;
}

struct Level3 {
    m: Int;
    n: Bool?;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            a:false,
            b:Level2{
                x:123,
                y:true,
                z: Level3{ m: 999, n: null }
            }
        };
    }
}