// Combined nested struct, optional, default value and primitive
struct Info {
    id: Int = 10;
    label: String?;
}

struct Wrapper {
    main: Info = Info{};
    extra: String? = null;
    flag: Bool = false;
}

contract NestedComboDefaults {
    val: Wrapper;

    init() {
        self.val = Wrapper{};
    }
}