struct Nested { x: Int; }

contract ExplicitNull {
    data: Nested? = null;
    receive() {}
}