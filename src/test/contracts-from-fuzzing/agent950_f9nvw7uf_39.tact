// nested struct inside optional struct, optional top-level contract parameter
struct NS1 { foo: Int; }
struct OS1 { bar: NS1?; }

contract OptParamNested(
    baz: OS1?
) {}