struct Dup {
    data: Int;
    info: String;
}

contract SameTypeNested {
    a: Dup;
    b: Dup;

    init() {
        self.a = Dup{data:1, info:"one"};
        self.b = Dup{data:2, info:"two"};
    }
}