struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
}

struct Toplevel {
    one: NestedDefaults?;
    two: NestedDefaults?;
}

contract DefaultOptionals {
    val: Toplevel;

    init() {
        self.val = Toplevel{
            one: null,
            two: NestedDefaults{},
        };
    }
}