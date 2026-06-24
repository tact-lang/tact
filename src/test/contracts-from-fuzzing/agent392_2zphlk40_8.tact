struct NestOptional {
  x: Int?;
  y: Inner?;
}

struct Inner {
  z: String?;
}

contract NestedOptionalContract {
    data: NestOptional;

    init() {
        self.data = NestOptional{
            x: null,
            y: null
        };
    }
}
