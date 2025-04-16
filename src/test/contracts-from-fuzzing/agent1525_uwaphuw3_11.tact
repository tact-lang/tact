struct Innermost {
    x: Int = 11;
    y: Bool = false;
}

struct Middle {
    a: Int = 5;
    inr: Innermost;
}

struct Outer {
    mid: Middle;
    done: Bool = true;
}

contract NestedDefaults {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Middle{
                inr: Innermost{
                    y: true
                }
            }
        };
    }
}