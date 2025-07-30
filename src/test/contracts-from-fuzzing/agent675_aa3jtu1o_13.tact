struct Child {
    value: Int = 7;
}

struct Parent {
    f1: Int=1; f2:Int=2; f3:Int=3; f4:Int=4; f5:Int=5;
    nested1: Child;
    nested2: Child;
    nested3: Child;
    nested4: Child;
    nested5: Child;
}

contract MultipleNestedFields {
    parent: Parent = Parent{
        nested1: Child{}, nested2: Child{}, nested3: Child{}, nested4: Child{}, nested5: Child{}
    };

    receive() {
        let _ = self.parent.f3;
    }
}