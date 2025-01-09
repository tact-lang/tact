primitive Int;
trait BaseTrait { }

trait T {
  abstract get fun getter(): Int;
}

contract TestContract with T {
  // does not override an abstract getter
}
