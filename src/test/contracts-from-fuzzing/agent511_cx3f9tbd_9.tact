struct OptionalNested {
    inner: Int?;
    text: String?;
}

struct Container {
    val: Int;
    opt: OptionalNested?;
}

contract TestContract {
    rec: Container;

    init() {
        self.rec = Container{
            val: 42,
            opt: null
        };
    }
}