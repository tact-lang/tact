struct OptIntNested {
    inner: Int?;
}

struct NestLayer2 {
    nested: OptIntNested?;
}

contract OptionalInsideNested {
    storage: NestLayer2;

    init() {
        self.storage = NestLayer2{
            nested: OptIntNested{ inner: 42 }
        };
    }
}