struct Combo {
    intVal: Int = 0;
    boolVal: Bool = false;
    strVal: String = "";
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;
}

contract StructField {
    data: Combo = Combo{};
    init() {}
}