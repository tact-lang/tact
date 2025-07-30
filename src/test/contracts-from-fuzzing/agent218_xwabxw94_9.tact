struct Spec {
    smallInt: Int as int4;
    bigInt: Int as int257;
    optInt: Int?;
}

contract SerializeHints {
    field: Spec;

    init() {
        self.field = Spec{ smallInt: 7, bigInt: 123456789, optInt: null };
    }
}