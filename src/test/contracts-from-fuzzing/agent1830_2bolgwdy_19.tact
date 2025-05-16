struct NestedManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: String?;
    o5: Cell?;
}

struct Container {
    inner: NestedManyOptionals;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            inner: NestedManyOptionals{
                o1:null, o2:null, o3:null, o4:null, o5:null
            }
        };
    }
}
