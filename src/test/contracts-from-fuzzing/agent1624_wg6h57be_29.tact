struct Lowest { val: Int?; }

struct Middle { low: Lowest; }

struct High { mid: Middle; }

contract NullableDeepLeaf {
    data: High;

    init() {
        self.data = High{
            mid: Middle{
                low: Lowest{
                    val: null,
                },
            },
        };
    }
}