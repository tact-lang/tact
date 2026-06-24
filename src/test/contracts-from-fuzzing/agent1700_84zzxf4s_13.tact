struct NestedOptional {
    x: Int;
    y: String?;
}

struct Container {
    content: NestedOptional?;
    flag: Bool;
}

contract OptInStructInContract {
    var1: Container?;

    init() {
        self.var1 = Container{
            content: NestedOptional{x: 7, y: "hi"},
            flag: true
        };
    }
}
