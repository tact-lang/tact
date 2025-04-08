struct DefaultsTest {
    a: Int = 5;
    b: Int?;
    c: String = "hello";
}

contract Defaults {
    val: DefaultsTest;

    init() {
        self.val = DefaultsTest{
            c: "world",
            a: 10,
            b: 20,
        };
    }
}