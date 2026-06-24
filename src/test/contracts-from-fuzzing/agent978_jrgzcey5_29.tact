// contract with composite field Int, String + optional composite
struct NS {
    x: Int;
    y: String;
}

contract OptCompositeTest {
    np: NS?;

    init() {
        self.np = null;
    }
}