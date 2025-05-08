struct OptionalSliceStruct {
    s: Slice?;
    txt: String;
}

contract OptionalSliceTest {
    data: OptionalSliceStruct;

    init() {
        self.data = OptionalSliceStruct{
            s:null,
            txt:"" 
        };
    }
}