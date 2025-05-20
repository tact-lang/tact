primitive Int;
trait BaseTrait {

}
trait T {
  abstract const BASIC: map<Int as uint8, Int as uint8>;
  abstract const PURE: map<Int, Int>;
  abstract const INT257: map<Int, Int>;
  abstract const COINS: map<Int, Int as coins>;
}

contract C with T {
  override const BASIC: map<Int as uint8, Int as uint8> = emptyMap();
  override const PURE: map<Int, Int> = emptyMap();
  override const INT257: map<Int as int257, Int as int257> = emptyMap();
  override const COINS: map<Int, Int as varuint16> = emptyMap();
}

