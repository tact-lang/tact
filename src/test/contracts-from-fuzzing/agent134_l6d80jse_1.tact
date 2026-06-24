struct InnerOptional {
    deepVal: Int?;
}

struct OuterStruct {
    nested: InnerOptional?; // optional nested struct
    val: Int;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: null,
            val: 1,
        };
    }
}