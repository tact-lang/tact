struct OptStructNestedDefault {
    count: Int = 0; 
    comment: String = "ok"; 
    opt: Bool? = null; 
}

contract DefaultInitTest {
    data: OptStructNestedDefault;

    init() {
        self.data = OptStructNestedDefault{};
    }
}