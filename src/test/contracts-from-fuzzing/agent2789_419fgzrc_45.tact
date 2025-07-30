struct ZeroDefaults {
    i: Int = 0;
    b: Bool = false;
    s: String = "";
    oi: Int? = null;
    ob: Bool? = null;

}

contract StructWithZeroDefaults {
    z: ZeroDefaults;

    init() {
        self.z = ZeroDefaults{};
    }
}