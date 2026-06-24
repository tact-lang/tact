struct CrossTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
}

contract CrossTypesContract {
    field1: CrossTypes;
    field2: CrossTypes;

    init() {
        self.field1 = CrossTypes{intField:1,boolField:true,stringField:"abc"};
        self.field2 = CrossTypes{intField:2,boolField:false,stringField:"def"};
    }
}