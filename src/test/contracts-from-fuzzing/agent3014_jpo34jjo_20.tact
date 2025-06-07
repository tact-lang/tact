// Contract with a struct containing nested optional
struct Foo {
    x: Int?;
    y: Bool?;
}

contract BigOpt {
    f: Foo;
    init() {
        self.f = Foo{
            x: null,
            y: null
        };
    }
}