contract TestStructParam(
    s: ComplexStruct,
) {
    get fun getS(): ComplexStruct {
        return self.s;
    }
}

struct ComplexStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address?;
    e: Inner;
}

struct Inner {
    x: String?;
    y: Int?;
    z: Bool;
}
