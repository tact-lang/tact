struct OptDeep3 {
    x: Int?;
}
struct OptDeep2 {
    x: OptDeep3?;
}
struct OptDeep1 {
    x: OptDeep2?;
}

contract DeepOptionalChain {
    val: OptDeep1;

    init() {
        self.val = OptDeep1{ x: null };
    }
}
