struct Deep {
    innermost: Int?;
}

struct Middle {
    deep: Deep?;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                deep: Deep{
                    innermost: null
                }
            }
        };
    }
}