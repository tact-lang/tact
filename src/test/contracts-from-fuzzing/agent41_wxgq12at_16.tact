struct OptionalNest {
    comment: String?;
}

struct Middle {
    layer: OptionalNest?;
}

contract CascadeNulls {
    data: Middle;

    init() {
        self.data = Middle{
            layer: OptionalNest{comment: null},
        };
    }
}
