struct Base {
    count: Int;
}

struct Container {
    list1: Base;
    list2: Base;
    list3: Base;
    list4: Base;
    list5: Base;
}

contract WideNested {
    c: Container;

    init() {
        self.c = Container{
            list1: Base{count:1},
            list2: Base{count:2},
            list3: Base{count:3},
            list4: Base{count:4},
            list5: Base{count:5},
        };
    }
}