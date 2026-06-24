struct Nested {
    inner1: Int;
    inner2: Bool;
    inner3: String?;
}

contract DeepStorage {
    nestedField: Nested; 
    flag: Bool = true;

    init() {
        self.nestedField = Nested{
            inner1: 1,
            inner2: false,
            inner3: null,
        };
    }
}
