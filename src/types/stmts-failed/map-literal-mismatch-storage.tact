contract MapLiteralMismatch {
    get fun test3(): map<Int as int64, Int as int32> {
        return map<Int as int32, Int as int64> {};
    }
}
