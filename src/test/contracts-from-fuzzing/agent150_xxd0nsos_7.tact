struct NestedOptionalStruct {
  n1: Inner1?;
}

struct Inner1 {
  n2: Inner2?;
}

struct Inner2 {
  n3: Int?;
  n4: Bool?;
}

contract ComplexNestedOptional {
    optStruct: NestedOptionalStruct;

    init() {
        self.optStruct = NestedOptionalStruct{
            n1: Inner1{
                n2: Inner2{
                    n3: 7,
                    n4: false
                }
            }
        };
    }
}