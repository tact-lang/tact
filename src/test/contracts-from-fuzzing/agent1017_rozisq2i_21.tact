message Msg { val: Int; }
struct Wrap { m: Msg; }
contract X(
  w: Wrap
) {}