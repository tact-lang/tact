struct MultiLevel {
    inn1: Int;
    inn2: Bool;
    inn3: String;
}

struct Wrap1 {
    nested: MultiLevel;
}

struct Wrap2 {
    nested: Wrap1;
}

struct Wrap3 {
    nested: Wrap2;
}

contract TestContract {
    data: Wrap3;
    init() {
        self.data = Wrap3{
            nested: Wrap2{
                nested: Wrap1{
                    nested: MultiLevel{
                        inn1:1, inn2:true, inn3:"x"
                    }
                }
            }
        };
    }
}