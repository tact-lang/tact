struct DeeplyNested1 {
    val: Int;
}

struct DeeplyNested2 {
    inner: DeeplyNested1;
}

struct DeeplyNested3 {
    inner: DeeplyNested2;
}

struct DeeplyNested4 {
    inner: DeeplyNested3;
}

struct DeeplyNested5 {
    inner: DeeplyNested4;
}

contract DeeplyNestedContract {
    data: DeeplyNested5;

    init() {
        self.data = DeeplyNested5{
            inner: DeeplyNested4{
                inner: DeeplyNested3{
                    inner: DeeplyNested2{
                        inner: DeeplyNested1{
                            val: 123,
                        },
                    },
                },
            },
        };
    }
}