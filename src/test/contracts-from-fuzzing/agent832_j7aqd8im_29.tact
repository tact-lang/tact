struct MixedOptionalDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract MixedOptDefaultsContract {
    val: MixedOptionalDefaults = MixedOptionalDefaults{};
    receive() {
        let _ = self.val.b;
    }
}