struct SomeData {
    val: Int = 123;
    text: String = "hi";
}

contract TestContract {
    opt: SomeData? = null;

    init() {
        self.opt = SomeData{
            val: 456,
            text: "changed",
        };
    }
}