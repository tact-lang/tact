struct OptionalSerialization {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract StorageTest {
    val: OptionalSerialization;

    init() {
        self.val = OptionalSerialization{
            a:null, b:true, c:null, d:null, e:null
        };
    }
}