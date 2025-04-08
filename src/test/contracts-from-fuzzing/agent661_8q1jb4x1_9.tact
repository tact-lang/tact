struct X {
    a: Int;
}

struct Y {
    b: X;
}

struct Z {
    c: Y;
}

contract TestContract {
    val: Z;

    init() {
        self.val = Z{
            c: Y{
                b: X{
                    a: 7
                }
            }
        };
    }
}