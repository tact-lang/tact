struct ManyOptionalFields {
    x: Int?;
    y: Int?;
    z: Int?;
    flag1: Bool?;
    flag2: Bool?;
}

contract ManyOptionalFieldsContract {
    data: ManyOptionalFields;

    init() {
        self.data = ManyOptionalFields{
            x:null, y:1, z:null, flag1:true, flag2:null
        };
    }
}