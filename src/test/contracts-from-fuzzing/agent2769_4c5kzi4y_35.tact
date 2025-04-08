struct IntOptional {
    a: Int?;
}

contract AssignedNull {
    x: IntOptional = IntOptional{a: null};
}