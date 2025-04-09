// nested mix with some default values
struct Sub {
    val1: Int = 100;
    val2: Bool = false;
}

struct Upper {
    sub: Sub;
    another: Bool?;
}

contract NestedDefault {
    data: Upper;
    init() {
        self.data = Upper{
            sub: Sub{},
            another: null
        };
    }
}