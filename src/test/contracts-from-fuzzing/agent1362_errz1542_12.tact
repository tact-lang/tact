struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Address?;
    f: Cell?;
}

contract MultiOptFields {
    m: MultipleOptionals = MultipleOptionals{ a:null, b:null, c:null, d:null, e:null, f:null };
}