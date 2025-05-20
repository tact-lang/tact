primitive Int;
primitive Int;
trait BaseTrait {

}
trait T {
  abstract const M: map<Cell, Int>;
}

contract C with T {
  override const M: map<Int as uint32, Int> = emptyMap();
}
