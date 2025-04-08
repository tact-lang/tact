message(0x2a) M { x: Int }

struct Wrap { m: M }

contract NestMsgInStruct {
    w: Wrap;
    init() { self.w = Wrap{ m: M{ x:5 } }; }
    receive() { let _=self.w.m; }
}