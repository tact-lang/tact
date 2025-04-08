message(123) MsgWithOpt { foo: Int? }

contract MsgWithOptContract {
    m: MsgWithOpt;

    init() {
        self.m = MsgWithOpt{ foo: null };
    }
}