contract MapLiteralRuntime {
    get fun runtime(x: Int): map<Int as uint4, Int as uint4> {
        return map<Int as uint4, Int as uint4> {
            1: x,
            2: x,
        };
    }
}
