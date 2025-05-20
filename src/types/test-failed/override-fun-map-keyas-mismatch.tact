primitive Int;
trait BaseTrait {

}
trait T {
  abstract get fun test1(): map<Int as int32, Int>;
}

contract C with T {
  override get fun test1(): map<Int as int8, Int> {
    return emptyMap();
  }
}
