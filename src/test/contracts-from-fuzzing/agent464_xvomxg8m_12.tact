struct DeepOptDefaults {
    val: Int? = null;
}

contract CombineDefOpt {
    data: DeepOptDefaults;

    init() {
        self.data = DeepOptDefaults{};
    }
}
