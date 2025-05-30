struct OptionalChain {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract InitPartialOptionals {
    oc: OptionalChain;

    init() {
        self.oc = OptionalChain{
            o1: 10,
            o2: null,
            o3: "hello"
        };
    }

    receive() {
        let _ = self.oc.o3;
    }
}