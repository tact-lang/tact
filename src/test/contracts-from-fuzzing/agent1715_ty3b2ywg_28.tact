struct DefaultTest {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
}

contract TestContract {
    val: DefaultTest = DefaultTest{};
}