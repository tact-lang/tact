struct Inner {
    x: Int?;
}

struct Outer {
    nullable: Inner?;
}

contract NullNested {
    state: Outer;

    init() {
        self.state = Outer{
            nullable: null
        };
    }
}