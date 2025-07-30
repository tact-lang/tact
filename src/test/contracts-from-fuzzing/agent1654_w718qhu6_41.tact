struct Defaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "x";
}

struct OptionStruct {
    opt: Defaults?;
}

contract ParamsOptNested(
    val: OptionStruct
) {
    // struct with optional nesting as param
}