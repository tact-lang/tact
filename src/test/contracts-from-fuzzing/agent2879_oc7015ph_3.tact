struct NestedOpt {
    x: Int?; 
    y: Bool?;
}

contract Test {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{x: null, y: true};
    }
}