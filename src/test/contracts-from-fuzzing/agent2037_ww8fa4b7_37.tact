// Testing optionals *with explicit default* in nested struct
struct HasOptDefault {
  score: Int? = null;
  name: String = "default";
}

contract NestedOptDefaults {
    data: HasOptDefault;

    init() {
        self.data = HasOptDefault{};
    }
}
