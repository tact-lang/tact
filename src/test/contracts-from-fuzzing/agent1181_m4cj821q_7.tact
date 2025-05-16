struct OptionalNested {
    val: Int?;
    sub: SubType?;
}

struct SubType {
    x: Int;
    y: String?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val: null,
            sub: null
        };
    }
}