struct OptTest {
    foo: Int?;
    bar: Bool?;
    note: String?;
}

contract TestContract {
    val: OptTest = OptTest{ foo: null, bar: null, note: null };
}