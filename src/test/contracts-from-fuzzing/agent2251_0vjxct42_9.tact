struct DeeplyNested1 { v: Int; }
struct DeeplyNested2 { inner: DeeplyNested1; }
struct DeeplyNested3 { inner: DeeplyNested2; }
struct DeeplyNested4 { inner: DeeplyNested3; }
struct DeeplyNested5 { inner: DeeplyNested4; }

contract DeepNestContract {
    deep: DeeplyNested5;

    init() {
        self.deep = DeeplyNested5{
            inner: DeeplyNested4{
                inner: DeeplyNested3{
                    inner: DeeplyNested2{
                        inner: DeeplyNested1{v: 123},
                    },
                },
            },
        };
    }
}