struct Point { x: Int; y: Int }

struct WithOptionalPoint {
    location: Point?;
}

contract OptionalNestedStruct {
    data: WithOptionalPoint;
    
    init() {
        self.data = WithOptionalPoint{
            location: null
        };
    }
}
