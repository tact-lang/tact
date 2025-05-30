struct Bottom {
    x: Int = 5;
    y: Bool?; // defaults to null
}

struct Middle {
    b: Bottom;
    name: String = "default";
}

contract NestedDefaultsTest {
    storage: Middle;

    init() {
        self.storage = Middle{
            b: Bottom{}, // omit y, relies on implicit null
            // omit name, should default to "default"
        };
    }
}