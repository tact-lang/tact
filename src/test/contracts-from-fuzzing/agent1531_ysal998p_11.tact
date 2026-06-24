struct Edge {
    a: Int?;
    b: String;
    c: Bool?;
    d: Address;
}

contract StorageTest {
    edge: Edge;

    init() {
        self.edge = Edge{
            a: null,
            b: "b",
            c: null,
            d: myAddress(),
        };
    }
}
