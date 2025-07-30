// testing optional message in optional struct
message(0x101) InnerMsg { foo: Int; }

struct Wrap {
    bar: InnerMsg?;
}

contract MsgInStructOpt {
    val: Wrap?;

    init() {
        self.val = Wrap{
            bar: InnerMsg{ foo: 555 }
        };
    }
}