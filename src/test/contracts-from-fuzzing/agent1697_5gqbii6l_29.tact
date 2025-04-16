struct NestedDiff {
    a: Int;
    b: Bool;
}

struct OuterDiff {
    x: NestedDiff;
    y: NestedDiff;
}

contract TestContract {
    field: OuterDiff;

    init() {
        self.field = OuterDiff{
            x: NestedDiff{a:1,b:true},
            y: NestedDiff{a:2,b:false}
        };
    }
}