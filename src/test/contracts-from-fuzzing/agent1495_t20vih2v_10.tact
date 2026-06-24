struct NullableSub {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Container {
    sub1: NullableSub;
    sub2: NullableSub;
}

contract NestedOptionals {
    data: Container;

    init() {
        self.data = Container{
            sub1: NullableSub{ x:null, y:true, z:null },
            sub2: NullableSub{ x:1, y:null, z:"z" }
        };
    }
}