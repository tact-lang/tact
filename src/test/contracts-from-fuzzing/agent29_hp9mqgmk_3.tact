struct Nested {
    int_map: map<Int, Int>;
    cell_map: map<Int, Cell>;
    addr_map: map<Int, Address>;
    bool_map: map<Int, Bool>;
}

contract TestContract {
    n: Nested;
    init() {
        self.n = Nested{
            int_map: emptyMap(),
            cell_map: emptyMap(),
            addr_map: emptyMap(),
            bool_map: emptyMap()
        };
    }
}