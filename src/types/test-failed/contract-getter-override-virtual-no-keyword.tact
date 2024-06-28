primitive Int;
trait BaseTrait { }

trait T {
   virtual get fun getter(): Int { return 42 }
}

contract TestContract with T {
  get fun getter(): Int { return 43 }
}
