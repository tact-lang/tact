struct Dummy { field: Int; }

contract TestStructInstantiation {
    fun showcase() {
        let d = Dummy{ field: 123 };
        dump(d.field); // expected output: 123
    }
}
