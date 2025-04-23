contract MapLiteralMismatch {
    get fun test2(): Int {
        let x: map<Address, Cell> =
            map<Int as int32, Int as int32> {};
        return 0;
    }
}
