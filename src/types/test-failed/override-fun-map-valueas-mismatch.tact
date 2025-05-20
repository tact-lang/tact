primitive Int;
trait BaseTrait {

}
trait T {
  abstract get fun test1(): map<Int, Int as int32>;
}

contract C with T {
  override get fun test1(): map<Int, Int as int64> {
    return emptyMap();
  }
}
