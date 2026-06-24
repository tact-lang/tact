message(1) MyMsg { f: Int }

struct WrapMsg { m: MyMsg }

contract MsgInsideStruct {
    f: WrapMsg;

    init() {
        self.f = WrapMsg { m: MyMsg { f: 3 } };
    }
}
