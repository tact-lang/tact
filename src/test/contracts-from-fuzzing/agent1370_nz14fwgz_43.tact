// param with nested optional struct with its own optionals
struct NestedOpt {
    x: Int?;
    y: Bool?;
}

contract ParamNestedOpt(
    no: NestedOpt? 
) {}