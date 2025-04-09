// optional message as state var
message(111) M1 { x: Int; }

contract OptMsgStateVar {
  val: M1? = null;
  init() {}
}