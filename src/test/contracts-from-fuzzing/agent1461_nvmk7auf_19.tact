struct SubStruct {
    p: Int = 5;
    q: String = "abc";
}

struct OptStructHolder {
    s: SubStruct?;
}

contract OptionalStructField {
    field: OptStructHolder;

    init() {
        self.field = OptStructHolder{
            s: SubStruct{}
        };
    }
}