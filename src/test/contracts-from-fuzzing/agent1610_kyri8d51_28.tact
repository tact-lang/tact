struct ManyNullablePrimitives {
    a: Int?;
    b: Bool?;
    c: String?;
}
struct NullableWrapper {
    a: ManyNullablePrimitives?;
}
contract WrapOpt {
    f: NullableWrapper;
    init() {
        self.f = NullableWrapper{
            a: ManyNullablePrimitives{ a:null, b:null, c:null }
        };
    }
}