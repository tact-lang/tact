contract MapLiteralMismatch {
    get fun test3(): Int {
        let x = map<Int as int32, Int as int640> {};
        return 0;
    }
}
