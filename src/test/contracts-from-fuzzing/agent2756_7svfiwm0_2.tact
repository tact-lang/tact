struct Inner { value: Int; optionalVal: Bool?; }

struct Middle { innerStruct: Inner; anotherInt: Int; }

contract NestedOptional {
    middle: Middle;
    
    init() {
        self.middle = Middle{
            innerStruct: Inner{ value: 42, optionalVal: null },
            anotherInt: 99
        };
    }
}