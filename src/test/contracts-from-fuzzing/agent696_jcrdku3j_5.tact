struct DeeplyNested3 {
    y: Int;
}

struct DeeplyNested2 {
    z: DeeplyNested3;
}

struct DeeplyNested1 {
    inner: DeeplyNested2;
}

contract TestContract {
    nest: DeeplyNested1;

    init() {
        self.nest = DeeplyNested1{
            inner: DeeplyNested2{
                z: DeeplyNested3{
                    y: 123
                }
            }
        };
    }
}