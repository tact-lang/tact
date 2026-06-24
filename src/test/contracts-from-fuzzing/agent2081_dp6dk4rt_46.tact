struct OnlyNullOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract DefaultsOptionals {
    val: OnlyNullOptionals = OnlyNullOptionals{a: null, b: null, c: null};
}