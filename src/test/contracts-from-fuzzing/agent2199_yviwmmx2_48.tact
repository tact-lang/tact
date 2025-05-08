contract StructAsOptional {
    x: Inner?;
    init() {
        self.x = null;
        self.x = Inner{a: 10, b:true};
    }
}

struct Inner {
    a: Int;
    b: Bool;
}
