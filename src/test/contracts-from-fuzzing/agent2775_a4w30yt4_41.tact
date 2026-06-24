trait A {
    aVar: Int;
}
trait B {
    bVar: Int;
}

contract MultiTrait(
    aVar: Int,
    bVar: Int
) with A, B {}