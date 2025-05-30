// Contract param with struct containing null defaults
struct WithDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract ParamDefaults(
    param: WithDefaults,
) {}
