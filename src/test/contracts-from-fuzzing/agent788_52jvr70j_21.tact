struct ManyNestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct NestLayer {
    v: ManyNestedOptionals?;
}

contract OuterOptionals {
    layer: NestLayer;

    init() {
        self.layer = NestLayer{
            v: null
        };
    }
}