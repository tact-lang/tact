// Compose a contract with nested optionals but initializing only some
struct Inner {
    val: Int?;
    flag: Bool?;
    note: String?;
}

contract PartialNestedOptionals {
    data: Inner?;

    init() {
        self.data = Inner{
            val: null,
            flag: true,
            note: null
        };
    }
}