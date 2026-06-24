struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract OptionalNested {
    state: InnerOpt;
    count: Int = 100;

    init() {
        self.state = InnerOpt { x: null, y: true };
        self.count = 200;
    }
    
    receive() {
        if (self.state.x != null) {
            let _ = self.state.x!! + self.count;
        }
    }
}