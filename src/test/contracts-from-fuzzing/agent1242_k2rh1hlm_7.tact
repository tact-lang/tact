struct OptionalDeepNest1 {
    a: OptionalDeepNest2?;
}
struct OptionalDeepNest2 {
    b: OptionalDeepNest3?;
}
struct OptionalDeepNest3 {
    c: OptionalDeepNest4?;
}
struct OptionalDeepNest4 {
    d: Int?;
}

contract TestContract {
    val: OptionalDeepNest1;

    init() {
        self.val = OptionalDeepNest1{
            a: null
        };
    }
}