struct Nester1 {
    i: Int;
}

struct Nester2 {
    n1: Nester1;
}

struct Nester3 {
    n2: Nester2;
}

contract Nested3 {
    d: Nester3;

    init() {
        self.d = Nester3{
            n2: Nester2{
                n1: Nester1{
                    i: 9,
                },
            },
        };
    }
}
