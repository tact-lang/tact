// testing deeply nested multiple optional inner layers with defaults
struct I1 { a: Int; }
struct I2 { i: I1?; }
struct I3 { i: I2?; }
struct I4 { i: I3?; }
struct I5 { i: I4?; }

contract DeepOptLayers {
    foo: I5? = null;
    init() {}
}