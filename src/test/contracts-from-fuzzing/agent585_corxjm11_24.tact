struct DeepOptionals1 {
    a: Int?;
}
struct DeepOptionals2 {
    a: DeepOptionals1?;
}
struct DeepOptionals3 {
    a: DeepOptionals2?;
}

contract DeepNullableChains {
    val: DeepOptionals3;

    init() {
        self.val = DeepOptionals3{ a: null };
    }
}
