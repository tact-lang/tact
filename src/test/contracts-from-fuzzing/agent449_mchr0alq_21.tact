// Params with nested struct having default value
struct WithDefaults {
    x: Int = 5;
    y: Bool = true;
}

contract ParamsWithNestedDefaults(
    a: WithDefaults,
) {}
