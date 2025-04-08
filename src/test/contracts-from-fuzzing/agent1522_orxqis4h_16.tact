struct OptionalStructs {
    nested1: Int?;
    nested2: Bool?;
    nested3: Cell?;
    nested4: Slice?;
}

struct ContainerOptional {
    content: OptionalStructs?;
    marker: Int;
}

contract OptStructWrap {
    bag: ContainerOptional;

    init() {
        self.bag = ContainerOptional{
            content: null,
            marker: 777,
        };
    }

    receive() {
        let _ = self.bag;
    }
}