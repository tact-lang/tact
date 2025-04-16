message(0xDEAD) M { x: Int; }

struct WrapM { val: M; }

contract PersistMsgStruct {
    wrap: WrapM;
    init() {
        self.wrap = WrapM{val: M{x:123}};
    }
}