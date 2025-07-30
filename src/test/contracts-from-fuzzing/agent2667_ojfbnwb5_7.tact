struct NestedOptionals {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int?;
    y: Bool?;
}

contract NestedOptionalsContract {
    data: NestedOptionals;
    
    init() {
        self.data = NestedOptionals{inner: null};
    }
    
    receive() {
        self.data = NestedOptionals{inner: InnerStruct{x: 5, y: false}};
    }
}