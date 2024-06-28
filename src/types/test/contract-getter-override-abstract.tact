primitive Int;
trait BaseTrait { }

trait T {
  abstract get fun getter(): Int;
}

contract TestContract with T {
  override get fun getter(): Int { return 0 }
}
