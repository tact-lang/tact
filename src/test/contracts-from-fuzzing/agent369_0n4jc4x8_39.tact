struct OptStruct1 { a: Int?; }
struct OptStruct2 { s: OptStruct1?; }

contract DoubleOptionalStructTest {
    val: OptStruct2;

    init() {
        self.val = OptStruct2{ s: OptStruct1{ a: null } };
    }
}