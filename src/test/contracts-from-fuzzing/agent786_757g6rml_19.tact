struct Boo {
    f1: Bool;
    f2: Bool;
    f3: Bool;
}

contract BoolStructOptional {
    has: Boo?;

    init() {
        self.has = Boo{
            f1: true,
            f2: false,
            f3: true
        };
    }
}