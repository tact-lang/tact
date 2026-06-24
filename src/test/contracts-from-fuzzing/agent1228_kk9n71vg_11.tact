struct Deep {
    flag: Bool?;
    comment: String? = null;
    rating: Int = 0;
}

struct Top {
    id: Int;
    deep: Deep;
}

contract OptMix {
    value: Top;

    init() {
        self.value = Top{
            id: 99,
            deep: Deep{
                flag: null,
                rating: 5
            }
        };
    }
}