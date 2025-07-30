struct NestedSub {
    p: Int;
}

struct NestedMain {
    sub1: NestedSub?;
    sub2: NestedSub?;
    sub3: NestedSub?;
}

contract NestedOptionals {
    val: NestedMain;

    init() {
        self.val = NestedMain{
            sub1: null,
            sub2: null,
            sub3: NestedSub{ p: 0 }
        };
    }
}
