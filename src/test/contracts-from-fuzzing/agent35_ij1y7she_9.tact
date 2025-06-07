struct WrappedMap {
    m: map<Int, Int>;
}

contract MapWrapOpt {
    m: WrappedMap?;

    init() {
        self.m = null;
    }
}