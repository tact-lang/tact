struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptPersistent {
    data: OptStruct = OptStruct{a: null, b: null, c: null};

    init() {
        self.data = OptStruct{a: 5, b: true, c: "ok"};
    }

    receive() {
        let _ = self.data;
    }
}