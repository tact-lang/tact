struct OptSliceAndString {
    s: Slice?;
    t: String?;
}

contract TestOptionalCellTypes {
    data: OptSliceAndString;

    init() {
        self.data = OptSliceAndString{s:null, t:null};
    }

    receive() {
        let tmp = self.data;
    }
}