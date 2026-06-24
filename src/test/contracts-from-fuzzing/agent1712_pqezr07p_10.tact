message(777) InnerMsg {
    value: Int = 1;
}

struct OuterStruct {
    data: InnerMsg = InnerMsg{ value: 42 };
}

contract TestContract {
    storage: OuterStruct = OuterStruct{ data: InnerMsg{ value: 99 } };

    init() {
        self.storage = OuterStruct{ data: InnerMsg{ value: 123 } };
    }

    receive() {
        let _ = self.storage.data.value + 1;
    }
}