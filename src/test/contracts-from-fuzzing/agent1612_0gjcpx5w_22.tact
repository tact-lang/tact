struct DeepWithManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct Container {
    inner1: DeepWithManyOptionals;
    inner2: DeepWithManyOptionals;
}

contract ManyOptionalsDeep {
    data: Container;

    init() {
        self.data = Container{
            inner1: DeepWithManyOptionals{ a:null,b:null,c:null,d:null },
            inner2: DeepWithManyOptionals{ a:null,b:true,c:"hi",d:null },
        };
    }
}
