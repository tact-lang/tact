struct NestNulls {
    first: Inner?;
}

struct Inner {
    second: Int?;
}

contract NestedNulls {
    s: NestNulls;

    init() {
        self.s = NestNulls{
            first: null
        };
    }
}