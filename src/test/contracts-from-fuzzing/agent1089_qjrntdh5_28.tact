message(55) MsgOpt { x: Int?; }

struct Middle { m: MsgOpt = MsgOpt{}; }

contract MsgInStructStorage {
    s: Middle = Middle{};
}