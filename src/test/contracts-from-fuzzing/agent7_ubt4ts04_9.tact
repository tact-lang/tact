struct MyStruct {
    a: Int;
    b: Bool;
}

contract Playground {
    // Dump a cell converted from a struct instance
    fun dumpStructCell() {
        dump(MyStruct {
            a: 123,
            b: true
        }.toCell());
    }

    receive("plays") {
        self.dumpStructCell();
    }
}
