message(123) M {}
struct Deep1 { m: M?; }
struct Deep2 { x: Int; nest: Deep1; }
contract OptionalMsgDeep {
    d: Deep2;
    init() {
        self.d = Deep2 { x: 10, nest: Deep1 { m: null } };
    }
}
