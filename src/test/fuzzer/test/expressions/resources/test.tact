contract Test {
    receive() {}

    get fun getInt(): Int {
        let int1: Int = 0;
        let bool_null: Bool? = null;
        let opt_cell: Cell? = null;
        return ~((false ? opt_cell : opt_cell) == (bool_null!! ? opt_cell : opt_cell) ? int1 : int1);
    }
}
