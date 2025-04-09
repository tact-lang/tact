struct Inner { x: Int = 5; }

contract DefaultsOverNull {
  val: Inner? = null;
  init() {}
}