// deeply nested optional composite
struct Z {
    zval: Int?;
}

struct Y {
    yval: Z?;
}

struct X {
    xval: Y?;
}

struct Wrapper {
    wrap: X?;
}

contract TestContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            wrap: X{
                xval: Y{
                    yval: Z{
                        zval: null
                    }
                }
            }
        };
    }
}