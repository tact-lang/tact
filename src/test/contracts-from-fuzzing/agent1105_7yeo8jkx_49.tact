struct S1 { a: Int; }
struct OptionalWrap {
    inner: S1?;
}
contract StructOptionalWrap {
    val: OptionalWrap;
    init(){ self.val = OptionalWrap{ inner:null }; }
}