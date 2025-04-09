struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}
struct Wrap {
    inner: NestedOpt?;
}

contract Test {
    value: Wrap;
    init() {
        self.value = Wrap{inner:null};
    }
}
