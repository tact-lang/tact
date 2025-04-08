struct Chain {
    nxt: Next;
    flag: Bool;
}

struct Next {
    value: Int;
    name: String;
}

contract StructChain {
    link: Chain;

    init() {
        self.link = Chain{
            nxt: Next{ value: 777, name: "lucky" },
            flag: true
        };
    }
}