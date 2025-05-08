struct OnlyString {
    s: String;
}

contract ContractWithString {
    val: OnlyString;

    init() {
        self.val = OnlyString{ s: "Ton" };
    }
}
