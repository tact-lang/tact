struct OptionalNested {
    s: String?;
    i: Int?;
    b: Bool?;
}

struct Container {
    f1: OptionalNested;
    f2: String?;
    f3: Bool?;
    f4: Int?;
}

contract Optionals {
    data: Container;

    init() {
        self.data = Container{
            f1: OptionalNested{
                s:null, i:1, b:true
            },
            f2:null,
            f3:false,
            f4:42
        };
    }
}