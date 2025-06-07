struct Inner { val: Int; }

struct Outer { child: Inner?; }

contract NestedOptStructs {
    data: Outer? = null;
}
