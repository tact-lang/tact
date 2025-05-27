primitive Int;
trait BaseTrait { }

trait T {
  abstract get fun getter(): Int;
}

trait T1 with T {}

contract TestContract with T1 {
  // does not override an abstract getter
}
