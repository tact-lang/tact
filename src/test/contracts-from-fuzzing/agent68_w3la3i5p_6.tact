struct OptionalNested {
    val: Int?;
    deep: DeepStruct?;
}

struct DeepStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    s: String;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val: null,
            deep: null
        };
    }
}