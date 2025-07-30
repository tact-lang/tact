struct Val {
    intVal: Int = 5;
    boolVal: Bool = true;
    stringVal: String = "str";
}

contract Defaults {
    v: Val = Val{};
}
