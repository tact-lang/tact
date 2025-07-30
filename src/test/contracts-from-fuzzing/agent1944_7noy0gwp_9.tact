struct LargeStringStruct {
    longStr: String;
}

contract LargeStringField {
    data: LargeStringStruct;

    init() {
        self.data = LargeStringStruct{
            longStr: "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!" 
        };
    }
}