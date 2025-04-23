contract MapLiteralMismatch {
    get fun test1(): map<Int as int32, Int as int32> {
        return map<Address, Cell> {};
    }
}
