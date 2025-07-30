struct OptStruct {
    x: Int;
    y: Int?;
}

contract TestOptStruct {
    data: OptStruct;

    init() {
        self.data = OptStruct{x:5, y:null};
    }

    receive() {
        let tmp = self.data;
    }
}