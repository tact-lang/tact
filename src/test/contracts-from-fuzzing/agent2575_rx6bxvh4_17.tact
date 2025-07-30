struct OptionalAndDefault {
    a: Int?;
    b: Int = 10;
}

contract TestContract {
    val: OptionalAndDefault = OptionalAndDefault{
        a: null
    };
}