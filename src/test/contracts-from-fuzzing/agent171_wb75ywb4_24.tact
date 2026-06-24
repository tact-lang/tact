struct MixDefaults {
    foo: Int = 100;
    bar: Bool;
    baz: String = "def";
}

contract MixDefaultsTest {
    data: MixDefaults;
    init() {
        self.data = MixDefaults{ bar:true };
    }
}