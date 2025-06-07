struct InnerData {
    flag: Bool;
    label: String;
    num: Int;
}

contract FieldAssignmentChain {
    data: InnerData;

    init() {
        self.data = InnerData{ flag:false, label:"", num: 0 };
        self.data = InnerData{ flag:true, label:"x", num: 42 };
    }
}