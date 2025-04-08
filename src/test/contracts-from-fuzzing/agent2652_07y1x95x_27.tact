struct Inner1 {
    a: Int?;
}

struct Inner2 {
    b: String?;
}

struct NestBothOptional {
    x: Inner1;
    y: Inner2;
}

contract ComposeBothOptional {
    val: NestBothOptional;

    init() {
        self.val = NestBothOptional{
            x: Inner1{ a: null },
            y: Inner2{ b: null }
        };
    }
}