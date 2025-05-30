struct BigNest {
    x: Int; 
    y: Int?;
    inner: TinyNest;
}

struct TinyNest {
    f: Bool;
    name: String;
}

contract FieldsOrderTest {
    data1: Int;
    data2: BigNest;
    data3: Bool;
    data4: TinyNest;

    init() {
        self.data1 = 42;
        self.data2 = BigNest{ x: 1, y: null, inner: TinyNest{ f: true, name: "test" } };
        self.data3 = false;
        self.data4 = TinyNest { f: false, name: "hi" };
    }
}