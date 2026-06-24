struct InnerOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct ContainerOptionals {
    a: InnerOptionals?;
    b: InnerOptionals;
}

contract OptionalInnerFields {
    val: ContainerOptionals;
    init() {
        self.val = ContainerOptionals{a:null, b:InnerOptionals{i:null,b:null,s:null}};
    }
}