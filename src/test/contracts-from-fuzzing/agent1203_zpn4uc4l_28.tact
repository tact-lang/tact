struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Wrap {
    nest: NestedOptionals;
}

contract NestedOptionalStructWrap {
    val: Wrap;
    init() {
        self.val = Wrap{nest: NestedOptionals{a:null, b:null, c:null}};
    }
}