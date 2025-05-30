struct Mid {
    deep: Deep?;
}

struct Deep {
    val: Int;
}

contract DeepOptional {
    m: Mid;

    init() {
        self.m = Mid{
            deep: Deep{
                val: 99,
            },
        };
    }
}