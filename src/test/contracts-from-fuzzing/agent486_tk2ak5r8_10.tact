struct MixDefaults {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "ok";
    val4: Address;
}

contract TestMixDefaults {
    data: MixDefaults;

    init() {
        self.data = MixDefaults{
            val4: myAddress()
        };
    }
}