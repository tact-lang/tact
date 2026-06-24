struct SerializeOptionBool {
    flag: Bool?;
}

contract OptBoolTest {
    f: SerializeOptionBool;

    init() {
        self.f = SerializeOptionBool{
            flag: null
        };
    }
}