struct NestedOpt {
    v: Int?;
}

struct Container {
    n: NestedOpt;
    b: Bool;
}

contract OptInStruct {
    field: Container = Container{
        n: NestedOpt{ v: null },
        b: false
    };

    receive() {
        self.field = self.field;
    }
}