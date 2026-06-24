struct Recursive1 {
    x: Int;
    y: Recursive2;
}

struct Recursive2 {
    z: Int;
}

contract RecursionTest {
    storage: Recursive1;

    init() {
        self.storage = Recursive1{
            x: 5,
            y: Recursive2{z: 10},
        };
    }
}
