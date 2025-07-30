struct Crazy {
    n1: Int?;
    n2: Bool?;
    n3: String?;
    n4: Cell?;
    n5: Slice?;
    n6: Address?;
}

struct Wrapper {
    wrapped: Crazy;
}

contract TestContract {
    nestedOptional: Wrapper;

    init() {
        self.nestedOptional = Wrapper{
            wrapped: Crazy{
                n1: null, n2: null, n3: null, n4: null, n5: null, n6: null
            }
        };
    }
}