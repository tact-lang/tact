struct OptIntStr {
    intVal: Int?;
    strVal: String?;
}

contract OptCombined {
    field: OptIntStr = OptIntStr{ intVal: null, strVal: null };
}