// Remove default = myAddress() for stored fields, since it's not valid
struct BigStruct {
    v1: Int = 1;
    v2: Bool = false;
    v3: String = "";
    v4: Address;
    v5: Int?;
    v6: Bool?;
    v7: String?;
    v8: Address;
    v9: Int = 9;
    v10: Bool = true;
    v11: String = "hi";
    v12: Address;
}

contract TestContract {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            v1: 2, v2: true, v3: "ok", v4: myAddress(),
            v5: null, v6: null, v7: null, v8: myAddress(),
            v9: 100, v10: false, v11: "bye", v12: myAddress()
        };
    }

    receive() {
        self.s = self.s;
    }
}