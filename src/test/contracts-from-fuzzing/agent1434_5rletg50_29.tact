struct NestOptionDef {
    a: Int?;
    b: S?;
}
struct S {
    x: Int = 8;
}
contract StructOptDef {
    val: NestOptionDef;
    init() {
        self.val = NestOptionDef{ a:null, b:null };
    }
}