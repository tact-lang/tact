message Msg { val: Int = 1; }
struct Wrap { m: Msg = Msg{ val: 2 }; }
contract X {
  w: Wrap = Wrap{};
}