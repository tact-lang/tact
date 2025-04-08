struct BothKindsOptional {
    optInt: Int? = null;
    optStr: String? = null;
}

contract MixedOptionals {
    field: BothKindsOptional = BothKindsOptional{};
}