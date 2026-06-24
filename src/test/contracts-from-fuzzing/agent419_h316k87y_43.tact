// nested struct with string default inside optional top
struct Inner {
    s: String = "x";
}
contract TopOpt {
    x: Inner?;
    init() { self.x = null; }
}