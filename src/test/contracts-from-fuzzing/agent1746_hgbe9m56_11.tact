struct A1 {
    x: Int;
}

struct A2 {
    x: Int;
    next: A1;
}

struct A3 {
    x: Int;
    next: A2;
}

struct A4 {
    x: Int;
    next: A3;
}

struct A5 {
    x: Int;
    next: A4;
}

contract Layered {
    value: A5;

    init() {
        self.value = A5{
            x:5,
            next: A4{
                x:4,
                next: A3{
                    x:3,
                    next: A2{
                        x:2,
                        next: A1{x:1}
                    }
                }
            }
        };
    }
}
