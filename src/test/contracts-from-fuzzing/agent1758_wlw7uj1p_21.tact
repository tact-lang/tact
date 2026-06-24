struct Mixed {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
    e: String;
}

contract StorageTest {
    x: Mixed;

    init() {
        self.x = Mixed{
            a: 5,
            b: true,
            c: null,
            d: null,
            e: "hello"
        };
    }
}