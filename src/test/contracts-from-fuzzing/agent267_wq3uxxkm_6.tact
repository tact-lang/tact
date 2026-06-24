struct InnerOpt {
    val: Int?; // optional primitive inside struct
}

contract OptStructTest {
    field: InnerOpt?; // optional of struct

    init() {
        self.field = null; // set entire struct optional to null
    }
}