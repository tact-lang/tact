trait A { foo: Int }
trait B { bar: Int }

contract C(
    foo: Int,
    bar: Int
) with A, B {}