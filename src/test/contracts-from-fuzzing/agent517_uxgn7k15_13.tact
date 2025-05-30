struct DeeplyNested1 {
    inner: DeeplyNested2;
}
struct DeeplyNested2 {
    inner: DeeplyNested3;
}
struct DeeplyNested3 {
    inner: DeeplyNested4;
}
struct DeeplyNested4 {
    foo: Int;
}

contract DeeplyNestedTest {
    data: DeeplyNested1;
    init() {
        self.data = DeeplyNested1{
            inner: DeeplyNested2{
                inner: DeeplyNested3{
                    inner: DeeplyNested4{foo: 777}
                }
            }
        };
    }
}