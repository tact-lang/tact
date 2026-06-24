struct InnerStruct {
    n: Int;
    flag: Bool;
    txt: String;
}

contract StructInStorage {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{ n: 7, flag: true, txt: "hi" };
    }
}
