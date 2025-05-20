primitive Int;
trait BaseTrait {

}
trait T {
  abstract const M: map<Int, Int as uint8>;
}

contract C with T {
  override const M: map<Int, Int as uint32> = emptyMap();
}


