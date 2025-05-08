struct Innermost { v: Int }
struct Inner { nested: Innermost }

contract TestContract(
    param: Inner
) {}