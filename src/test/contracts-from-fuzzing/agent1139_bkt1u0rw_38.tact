struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct Container {
    data: InnerOpt?;
    data2: InnerOpt;
}

contract NestedStructsWithOpts {
    val: Container?;
    
    init() {
        self.val = Container{
            data: null,
            data2: InnerOpt{ x: null, y: null }
        };
    }
}