trait TDefault {
    foo: Int;
}

contract ParamsWithTrait(
    foo: Int
) with TDefault {}