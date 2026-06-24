struct OptNestedDeep {
    inner: Int?;
}

struct Level1 {
    deep: OptNestedDeep?;
}

contract OptionalOptionalsLevel {
    f: Level1;

    init() {
        self.f = Level1{
            deep: OptNestedDeep{
                inner: null
            }
        };
    }

    receive(){}
}