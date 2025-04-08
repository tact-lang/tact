struct NestedOptionals {
    inn: Inner?;
}

struct Inner {
    val: Int?;
}

contract NestedOptContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{inn:null};
    }
}