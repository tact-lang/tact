struct InnerMost {
    flag: Bool;
}

struct InnerContainer {
    inner_field: InnerMost;
}

struct Middle {
    cont: InnerContainer;
}

struct OuterMostStruct {
    mid: Middle;
}

contract DeeplyWrapped {
    storage: OuterMostStruct;

    init() {
        self.storage = OuterMostStruct{
            mid: Middle{
                cont: InnerContainer{
                    inner_field: InnerMost{ flag: true }
                }
            }
        };
    }
}