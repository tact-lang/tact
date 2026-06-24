struct NestedSub {
    sub_x: Int;
    sub_y: Bool;
}

struct Nested {
    nested_a: Int;
    nested_b: NestedSub;
}

contract TestContract {
    myField: Nested;

    init() {
        self.myField = Nested{
            nested_a: 5,
            nested_b: NestedSub{
                sub_x: 7,
                sub_y: false
            }
        };
    }
}
