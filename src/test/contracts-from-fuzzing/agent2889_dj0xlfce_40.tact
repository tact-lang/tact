struct A { x: Int; }
struct B { y: Int; }
struct AB { a: A; b: B; }

contract SwitchAB {
    data: AB;

    init() {
        self.data = AB{
            a: A{ x: 5 },
            b: B{ y: 7 }
        };
    }
}