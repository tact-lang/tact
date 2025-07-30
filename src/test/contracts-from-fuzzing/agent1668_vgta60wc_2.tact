struct NestedStructLevel3 {
    deepVal: Int; 
}

struct NestedStructLevel2 {
    inner: NestedStructLevel3;
    optionalInner: NestedStructLevel3?;
}

struct NestedStructLevel1 {
    level2: NestedStructLevel2;
    maybeLevel2: NestedStructLevel2?;
}

contract TestContract {
    data: NestedStructLevel1;
    init() {
        self.data = NestedStructLevel1{
            level2: NestedStructLevel2{
                inner: NestedStructLevel3{ deepVal: 5 },
                optionalInner: null,
            },
            maybeLevel2: null,
        };
    }
}
