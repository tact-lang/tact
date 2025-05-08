trait HasVar2 {
    another: Int;
}

contract ParamsAndTrait(
    some: Int,
    another: Int
) with HasVar2 {}