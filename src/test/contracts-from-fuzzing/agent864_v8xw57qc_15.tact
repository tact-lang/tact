struct OptStruct {
    x: Int?;
    y: Bool?;
}

contract OptStructUsage {
    data: OptStruct?;

    init() {
        self.data = null;
    }
    receive() {
        self.data = OptStruct{ x:444, y:true };
    }
}