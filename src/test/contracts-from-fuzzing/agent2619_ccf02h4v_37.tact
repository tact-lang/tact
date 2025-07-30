message EmptyM{}
message WrapM { inner: EmptyM }

contract MsgWrap {
    m: WrapM;

    init() {
        self.m = WrapM{ inner: EmptyM{} };
    }
}