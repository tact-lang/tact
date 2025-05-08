contract TestContract {
    foo: Int? = null;
}

struct RecStruct {
    val: Int?;
    note: String;
}

contract Another {
    recField: RecStruct = RecStruct{ val: null, note: "" };
}