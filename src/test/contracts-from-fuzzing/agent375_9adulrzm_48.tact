// Now deliberately attempt to use String as default inside struct field
struct WeirdDefaults {
    a: String = "constant text";
    b: String? = null;
}

contract TestContract {
    data: WeirdDefaults;

    init() {
        self.data = WeirdDefaults{};
    }
}
