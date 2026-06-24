struct OptionalNest {
    inn: Inner?;
}

struct Inner {
    val: Int;
}

contract NestNull {
    x: OptionalNest;
    init() {
        self.x = OptionalNest{inn:null};
    }
}