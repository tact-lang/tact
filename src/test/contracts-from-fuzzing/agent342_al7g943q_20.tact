struct StructWithString {
    s: String; 
}

struct OuterWithString {
    inner: StructWithString;
}

contract ContractWithStructString {
    field: OuterWithString;

    init() {
        self.field = OuterWithString{
            inner: StructWithString{s: "hello"}
        };
    }
}
