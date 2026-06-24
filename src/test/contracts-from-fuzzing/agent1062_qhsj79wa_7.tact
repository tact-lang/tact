struct NestedOptionals {
    inner1: Int?;
    inner2: Bool?;
    inner3: Address?;
}

struct Wrapper {
    wrapped: NestedOptionals?;
    label: String = "default";
}

contract Test {
    data: Wrapper = Wrapper{};
    
    init() {
        self.data = Wrapper{
            wrapped: NestedOptionals{
                inner1: 5,
                inner2: true,
                inner3: myAddress()
            },
            label: "init"
        };
    }
}