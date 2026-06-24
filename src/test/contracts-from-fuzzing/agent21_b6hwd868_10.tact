struct ManyOptionalsNested {
    one: Int?;
    two: Int?;
    three: Int?;
    four: Int?;
    five: Int?;
    six: Int?;
    seven: Int?;
    eight: Int?;
    nine: Int?;
    ten: Int?;
}

struct Wrapper {
    nested: ManyOptionalsNested;
}

contract BigOptionalContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            nested: ManyOptionalsNested{
                one: null, two: 2, three: null, four: 4, five: null,
                six: 6, seven: null, eight: 8, nine: null, ten: 10
            }
        };
    }
}