// Large nested struct with some optional nested struct field null
struct SubSub {
    data: Int;
}
struct Sub {
    s: Int;
    opt: SubSub?;
}
struct Top {
    a: Int;
    sub: Sub;
}
contract NestedNullInner {
    val: Top;
    init() {
        self.val = Top{
            a:1,
            sub: Sub{
                s:2,
                opt: null
            }
        };
    }
}