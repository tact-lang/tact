struct InnerOptional { foo: Int?; bar: Bool?; }

contract OptionalInnerStruct {
    s: InnerOptional?;
    init() {
        self.s = null;
    }
}