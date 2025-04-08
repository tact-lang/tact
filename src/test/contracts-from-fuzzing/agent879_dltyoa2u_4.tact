struct DefaultsOptionals {
    x: Int = 5;
    y: Int?;
    z: Int? = null;
}

contract DefaultOptionalTest {
    val: DefaultsOptionals;

    init() {
        self.val = DefaultsOptionals{ };
    }
}
