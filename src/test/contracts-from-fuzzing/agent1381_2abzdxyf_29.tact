struct NestOptDefault {
    a: Bool? = null;
}

struct OuterOptDef {
    b: Int? = null;
    c: NestOptDefault? = null;
}

contract TestContract {
    field: OuterOptDef;

    init() {
        self.field = OuterOptDef{};
    }
}