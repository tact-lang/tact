// Contract with deeply nested optional, some null some not
struct Deepest {
    a: Int?;
}

struct Middle {
    deep: Deepest?;
}

struct Surface {
    mid: Middle?;
}

contract PartialDeepNulls {
    root: Surface;

    init() {
        self.root = Surface{
            mid: Middle{
                deep: null
            }
        };
    }
}