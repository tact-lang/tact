struct OptStruct {
    inner: Inner?;
}
struct Inner {
    a: Int;
}
contract DeepOptionalReassign {
    outer: OptStruct;
    init() {
        self.outer = OptStruct{inner: null};
        self.outer = OptStruct{inner: Inner{a:7}};
    }
}