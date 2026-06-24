struct HasBool {
    flag: Bool;
}

struct HasInt {
    num: Int;
}

struct Container {
    b: HasBool;
    i: HasInt;
}

contract BoolIntStructs {
    val: Container;

    init() {
        self.val = Container{
            b: HasBool{flag: true},
            i: HasInt{num: 42}
        };
    }
}