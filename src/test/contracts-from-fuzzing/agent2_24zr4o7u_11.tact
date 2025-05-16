struct InnerA {
    x: Int;
    y: Bool;
    z: String;
    aopt: Int?;
}

struct InnerB {
    bopt1: Bool?;
    bopt2: Address?;
    bopt3: Cell?;
}

struct Container {
    one: InnerA;
    two: InnerB;
}

contract Combine {
    con: Container;

    init() {
        self.con = Container{
            one: InnerA{
                x: 1, y: true, z: "hello", aopt: null
            },
            two: InnerB{
                bopt1: false, bopt2: null, bopt3: null
            }
        };
    }
}