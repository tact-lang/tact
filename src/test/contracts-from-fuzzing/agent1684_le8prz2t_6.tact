struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptionalFieldsContract {
    data: OptionalStruct = OptionalStruct{optInt:null, optBool:null, optString:null};

    init() {
        self.data = OptionalStruct{optInt:10, optBool:true, optString:"test"};
    }
}